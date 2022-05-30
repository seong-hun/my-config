vim.opt.sw = 2 -- shiftwidth
vim.opt.ts = 2 -- tabstop
vim.opt.ai = true  -- auto indent
vim.opt.si = true  -- smart indet
vim.opt.clipboard = "unnamedplus"

-- For vim-vinegar
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

-- Colorscheme
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = pum
vim.opt.pumblend = 5

-- vim.opt.background = dark
-- vim.g.gruvbox_transparent_bg = 1
-- vim.cmd([[colorscheme gruvbox]])

vim.g.tokyonight_style = "storm"
vim.cmd([[colorscheme tokyonight]])

-- Which key
vim.opt.timeoutlen = 300

-- Find
vim.opt.path:remove "usr/include"
vim.opt.path:append "**"
vim.opt.wildignorecase = true
vim.opt.wildignore:append "**/*.pth"
