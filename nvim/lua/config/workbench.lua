local M = {}

function M.setup()
	local keymap = vim.api.nvim_set_keymap
	local default_opts = { noremap = true, silent = true }

	keymap("n", "<Leader>bp", "<Plug>ToggleProjectWorkbench", default_opts)
	keymap("n", "<Leader>bb", "<Plug>ToggleBranchWorkbench", default_opts)
	keymap("n", "<Leader><CR>", "<Plug>WorkbenchToggleCheckbox", default_opts)
end

return M
