local M = {}

function M.setup()
	local telescope = require('telescope')
	local actions = require('telescope.actions')

	local config = {
		defaults = {
			mappings = {
				n = {
					["q"] = actions.close
				},
			},
			file_ignore_patterns = {
				"%.pdf",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,                    -- false will only do exact matching
				override_generic_sorter = true,  -- override the generic sorter
				override_file_sorter = true,     -- override the file sorter
				case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
																				 -- the default case_mode is "smart_case"
			}
		}
	}

	local default_opts = { noremap = true, silent = true }
	local function nmap(key, map) vim.api.nvim_set_keymap("n", key, map, default_opts) end

	nmap("<Leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>")
	nmap("<Leader>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
	nmap("<Leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>")
	nmap("<Leader>fh", "<CMD>lua require('telescope.builtin').help_tags()<CR>")
	nmap("<Leader>gc", "<CMD>lua require('telescope.builtin').git_commits()<CR>")
	nmap("<Leader>gb", "<CMD>lua require('telescope.builtin').git_branches()<CR>")

	telescope.load_extension('fzf')
	telescope.setup(config)
end

return M
