local M = {}

function M.setup()
	local telescope = require('telescope')
	local actions = require('telescope.actions')

	local config = {
		defaults = {
			mappings = {
				n = {
					["q"] = actions.close,
					["<c-d>"] = require('telescope.actions').delete_buffer,
				},
				i = {
					["<C-h>"] = "which_key",
					["<c-d>"] = require('telescope.actions').delete_buffer,
				}
			},
			file_ignore_patterns = {
				"%.pdf",
			},
		},
		pickers = {
			buffers = {
				-- ignore_current_buffer = true,
				sort_mru = true,
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
		},
	}

	local default_opts = { noremap = true, silent = true }
	local function nmap(key, map) vim.api.nvim_set_keymap("n", key, map, default_opts) end

	nmap("<Leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>")
	nmap("<Leader>fg", "<CMD>lua require('telescope.builtin').live_grep()<CR>")
	nmap("<Leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>")
	-- nmap("<Leader>fb", "<CMD>lua require('config.telescope').my_buffers()<CR>")
	nmap("<Leader>fh", "<CMD>lua require('telescope.builtin').help_tags()<CR>")
	nmap("<Leader>gc", "<CMD>lua require('telescope.builtin').git_commits()<CR>")
	nmap("<Leader>gb", "<CMD>lua require('telescope.builtin').git_branches()<CR>")

	telescope.load_extension('fzf')
	telescope.setup(config)
end


function M.my_buffers(opts)
	local action_state = require('telescope.actions.state')
	local actions = require('telescope.actions')

	opts = opts or {}
	-- opts.previewer = false
	-- opts.sort_lastused = true
	-- opts.show_all_buffers = true
	-- opts.shorten_path = false
	opts.attach_mappings = function(prompt_bufnr, map)
		local delete_buf = function()
			local current_picker = action_state.get_current_picker(prompt_bufnr)
			local multi_selections = current_picker:get_multi_selection()

			if next(multi_selections) == nil then
				local selection = action_state.get_selected_entry()
				-- actions.close(prompt_bufnr)
				vim.api.nvim_buf_delete(selection.bufnr, {force = true})
			else
				-- actions.close(prompt_bufnr)
				for _, selection in ipairs(multi_selections) do
					vim.api.nvim_buf_delete(selection.bufnr, {force = true})
				end
			end
		end
		map('i', '<C-X>', delete_buf)
		return true
	end
	require('telescope.builtin').buffers(opts)
	-- require('telescope.builtin').buffers(require('telescope.themes').get_dropdown(opts))
end

return M
