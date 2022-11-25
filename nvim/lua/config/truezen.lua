local M = {}

function M.setup()
	local true_zen = require("true-zen")
	local default_opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_set_keymap
	local keyunmap = vim.api.nvim_del_keymap

	local config = {
		modes = { -- configurations per mode
      ataraxis = {
        shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
        backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
        minimum_writing_area = { -- minimum size of main window
          width = 70,
          height = 44,
        },
        quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
        padding = { -- padding windows
          left = 52,
          right = 52,
          top = 0,
          bottom = 0,
        },
        callbacks = {
          open_pre = function ()  -- run a function when opening Ataraxis mode
            vim.opt.conceallevel = 2
            -- vim.opt.concealcursor = "nc"

            keymap("n", "k", "gk", default_opts)
            keymap("n", "j", "gj", default_opts)
            keymap("n", "0", "g0", default_opts)
            keymap("n", "$", "g$", default_opts)
          end,
          close_pos = function ()  -- run a function when closing Ataraxis mode
            vim.opt.conceallevel = 0
            -- vim.opt.concealcursor = ""

            keyunmap("n", "k")
            keyunmap("n", "j")
            keyunmap("n", "0")
            keyunmap("n", "$")
          end,
        },
      },
      minimalist = {
        ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
        options = { -- options to be disabled when entering Minimalist mode
          number = false,
          relativenumber = false,
          showtabline = 0,
          signcolumn = "no",
          statusline = "",
          cmdheight = 1,
          laststatus = 0,
          showcmd = false,
          showmode = false,
          ruler = false,
          numberwidth = 1
        },
        open_callback = nil, -- run a function when opening Minimalist mode
        close_callback = nil, -- run a function when closing Minimalist mode
      },
      narrow = {
        --- change the style of the fold lines. Set it to:
        --- `informative`: to get nice pre-baked folds
        --- `invisible`: hide them
        --- function() end: pass a custom func with your fold lines. See :h foldtext
        folds_style = "informative",
        run_ataraxis = true, -- display narrowed text in a Ataraxis session
        open_callback = nil, -- run a function when opening Narrow mode
        close_callback = nil, -- run a function when closing Narrow mode
      },
      focus = {
        open_callback = nil, -- run a function when opening Focus mode
        close_callback = nil, -- run a function when closing Focus mode
      }
    },
    integrations = {
			tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
			kitty = { -- increment font size in Kitty. Note: you must set `allow_remote_control socket-only` and `listen_on unix:/tmp/kitty` in your personal config (ataraxis)
				enabled = false,
				font = "+3"
			},
			twilight = false, -- enable twilight (ataraxis)
      lualine = true,
		},
	}

	vim.api.nvim_create_user_command(
		"TZ",
		"TZAtaraxis",
		{}
	)

	true_zen.setup(config)
end

return M
