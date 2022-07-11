local M = {}

function M.setup()
	local true_zen = require("true-zen")
	local keymap = vim.api.nvim_set_keymap
	local keyunmap = vim.api.nvim_del_keymap
	local default_opts = { noremap = true, silent = true }

	local config = {
		ui = {
			bottom = {
				laststatus = 0,
				ruler = false,
				showmode = false,
				showcmd = false,
				cmdheight = 1,
			},
			top = {
				showtabline = 0,
			},
			left = {
				number = true,
				relativenumber = false,
				signcolumn = "no",
			},
		},
		modes = {
			ataraxis = {
				left_padding = 28,
				right_padding = 30,
				top_padding = 1,
				bottom_padding = 1,
				ideal_writing_area_width = {0},
				auto_padding = false,
				keep_default_fold_fillchars = true,
				custom_bg = {"none", ""},
				bg_configuration = true,
				quit = "untoggle",
				ignore_floating_windows = true,
				affected_higroups = {
					NonText = true,
					FoldColumn = true,
					ColorColumn = true,
					VertSplit = true,
					StatusLine = true,
					StatusLineNC = true,
					SignColumn = true,
				},
			},
			focus = {
				margin_of_error = 5,
				focus_method = "experimental"
			},
		},
		integrations = {
			vim_gitgutter = false,
			tmux = true,
			gitsigns = true,
			nvim_bufferline = true,
			limelight = false,
			lualine = true,
		},
		misc = {
			on_off_commands = false,
			ui_elements_commands = false,
			cursor_by_mode = false,
		}
	}

	true_zen.after_mode_ataraxis_on = function ()
		vim.opt.conceallevel = 2
		-- vim.opt.concealcursor = "nc"

		keymap("n", "k", "gk", default_opts)
		keymap("n", "j", "gj", default_opts)
		keymap("n", "0", "g0", default_opts)
		keymap("n", "$", "g$", default_opts)
	end

	true_zen.after_mode_ataraxis_off = function ()
		vim.opt.conceallevel = 0
		-- vim.opt.concealcursor = ""

		keyunmap("n", "k")
		keyunmap("n", "j")
		keyunmap("n", "0")
		keyunmap("n", "$")
	end

	vim.api.nvim_create_user_command(
		"TZ",
		"TZAtaraxis",
		{}
	)

	true_zen.setup(config)
end

return M
