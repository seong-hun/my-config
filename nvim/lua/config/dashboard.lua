local M = {}

function M.setup()
  local db = require("dashboard")
  local config = {theme = "hyper"}
  db.setup(config)
end

return M

