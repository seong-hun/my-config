local M = {}

function M.setup()
	require 'nvim-treesitter.configs'.setup {
		highlight = {
			enable = true,
		},
		sync_install = false,
		-- indent = {
		-- 	enable = false,
		-- 	disable = {},
		-- },
		ensure_installed = {"lua", "python", "yaml"},
		ignore_install = { "latex" },
	}
end

return M
