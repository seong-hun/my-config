local M = {}

function M.setup()
  local lspsaga = require("lspsaga")
  vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>")
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
  lspsaga.setup({finder = {default = "def+ref+imp"}})
end

return M
