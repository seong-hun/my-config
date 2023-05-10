local M = {}

function M.setup()
  local saga = require("lspsaga")
  vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
  saga.setup()
end

return M
