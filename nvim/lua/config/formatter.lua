local M = {}

function M.setup()
	-- Utilities for creating configurations
	local util = require "formatter.util"

	vim.cmd([[
		augroup FormatAutogroup
			autocmd!
			autocmd BufWritePost * FormatWrite
		augroup END
	]])

	-- Provides the Format and FormatWrite commands
	require('formatter').setup {
		-- All formatter configurations are opt-in
		filetype = {
			lua = { require('formatter.filetypes.lua').stylua },
			python = {
				require('formatter.filetypes.python').black,
				require('formatter.filetypes.python').isort,
			},
			yaml = { require('formatter.filetypes.yaml').pyaml },
		}
	}
end

return M
