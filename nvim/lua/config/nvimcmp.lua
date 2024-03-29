local M = {}

function M.setup()

    vim.cmd [[set completeopt=menu,menuone,noselect]]

    local cmp = require 'cmp'
    local lspkind = require('lspkind')

    cmp.setup {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered()
        },
        formatting = {
            format = lspkind.cmp_format({
                wirth_text = false,
                -- mode = 'symbol',
                maxwidth = 50
            })
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({select = false})
        }),
        sources = cmp.config.sources({
            {name = 'nvim_lsp'}, {name = 'vsnip'} -- For vsnip users.
        }, {{name = 'buffer'}})
    }

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
        }, {{name = 'buffer'}})
    })

    cmp.setup.filetype('tex', {sources = cmp.config.sources {{name = 'omni'}}})

    -- cmp.setup.buffer {
    -- 	formatting = {
    -- 		format = function(entry, vim_item)
    -- 			vim_item.menu = ({
    -- 				omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
    -- 				buffer = "[Buffer]",
    -- 				-- formatting for other sources
    -- 			})[entry.source.name]
    -- 			return vim_item
    -- 		end,
    -- 	},
    -- 	sources = {
    -- 		{ name = 'omni' },
    -- 		{ name = 'buffer' },
    -- 		-- other sources
    -- 	},
    -- }

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {{name = 'buffer'}}
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({{name = 'path'}}, {{name = 'cmdline'}})
    })

end

return M
