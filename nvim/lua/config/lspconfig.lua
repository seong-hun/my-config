local M = {}

function M.setup()
	local nvim_lsp = require('lspconfig')
	local protocol = require('vim.lsp.protocol')

	-- Mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { noremap=true, silent=true }
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

	local on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local bufopts = { noremap=true, silent=true, buffer=bufnr }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
		vim.keymap.set('n', 'gD', 'gd', bufopts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
		vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
		vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	end

	local capabilities = require('cmp_nvim_lsp').default_capabilities(
		vim.lsp.protocol.make_client_capabilities()
	)

	-- Setup lspconfig.
	nvim_lsp.pyright.setup {
		on_attach = on_attach,
		filetypes = { "python" },
		capabilities = capabilities,
		root_dir = nvim_lsp.util.root_pattern(".git"),
	}

	-- Setup efm
	local efm_on_attach = function(client)
			if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_command [[augroup Format]]
					vim.api.nvim_command [[autocmd! * <buffer>]]
					vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.format { async = true }]]
					vim.api.nvim_command [[augroup END]]
			end
	end


	nvim_lsp.efm.setup {
		on_attach=efm_on_attach,
		init_options = {documentFormatting = true},
		settings = {
			rootMarkers = {".git/"},
			languages = {
				-- lua = {
				-- 	{formatCommand = "lua-format -i", formatStdin = true}
				-- },
				python = {
					{formatCommand = "black --quiet -", formatStdin = true},
					{formatCommand = "isort --quiet -", formatStdin = true},
				}
			}
		}
	}
end

return M
