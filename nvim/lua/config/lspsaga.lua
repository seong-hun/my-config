local M = {}

function M.setup()

	local saga = require 'lspsaga'

	saga.init_lsp_saga {
		error_sign = '',
		warn_sign = '',
		hint_sign = '',
		infor_sign = '',
		border_style = "round",
	}

	local keymap = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }

	keymap("n", "gh", "<CMD>Lspsaga lsp_finder<CR>", opts)

end

return M
