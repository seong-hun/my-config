local M = {}

function M.setup() 
	local config = {
		enabled = true,
		languages = {
			python = {
				template = {
					annotation_convention = "numpydoc"
				}
			},
		}
	}

	local opts = { noremap = true, silent = true }
	vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

	require('neogen').setup(config)
end

return M
