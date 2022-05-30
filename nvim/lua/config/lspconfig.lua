local M = {}

function M.setup()
	local nvim_lsp = require('lspconfig')
	local protocol = require('vim.lsp.protocol')

	local on_attach = function(client, bufnr)
		local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
		local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

		-- Enable completion triggered by <c-x><c-o>
		buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- Mappings
		local opts = { noremap = true, silent = true }

		buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
		buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
		buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

		buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
		buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
		buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
		buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
		buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
		buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
		buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
		buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
		-- buf_set_keymap('n', '<C-j>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

	end

	local capabilities = require('cmp_nvim_lsp').update_capabilities(
		vim.lsp.protocol.make_client_capabilities()
	)

	-- Setup lspconfig.
	nvim_lsp.pyright.setup {
		on_attach = on_attach,
		filetypes = { "python" },
		capabilities = capabilities,
		root_dir = nvim_lsp.util.root_pattern(".git"),
	}
end

return M
