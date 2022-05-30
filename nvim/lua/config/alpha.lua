local M = {}

function M.setup()
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

	local dashboard = require "alpha.themes.dashboard"

	dashboard.opts.opts.noautocmd = true

	alpha.setup(dashboard.config)
end

return M
