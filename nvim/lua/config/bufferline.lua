local M = {}

function M.setup()
	local config = {
		options = {
			numbers = "none",
			diagnostics = "nvim_lsp",
			separator_style = "slant",
			show_tab_indicators = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			diagnostics = "nvim_lsp",
			enforce_regular_tabs = true,
		},
		highlights = {
			fill = {
				guibg = {
					attribute = "bg",
					highlight = "bg",
				}
			}
		}
	}

	require("bufferline").setup(config)
end

return M
