local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Move between windows
keymap("n", "<C-J>", "<C-W><C-J>", default_opts)
keymap("n", "<C-K>", "<C-W><C-K>", default_opts)
keymap("n", "<C-L>", "<C-W><C-L>", default_opts)
keymap("n", "<C-H>", "<C-W><C-H>", default_opts)

-- Move between tabs
keymap("n", "[t", ":tabp<CR>", default_opts)
keymap("n", "]t", ":tabn<CR>", default_opts)
