local M = {}

M.install_plugins = function(plugins)
  if type(plugins) ~= "table" or #plugins == 0 then
    error "No plugins specified"
  end

  local lazy = require "lazy"
  local install_plugins = {}

  for _, plugin in ipairs(plugins) do
    if type(plugin) == "table" and plugin[1] then
      table.insert(install_plugins, plugin)
    else
      error "Invalid plugin specification"
    end
  end

  lazy.setup(install_plugins, {
    install = {
      missing = true,
      colorscheme = { "default" },
    },
    ui = {
      border = "rounded",
    },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "zipPlugin",
          "tarPlugin",
          "netrwPlugin",
        },
      },
    },
  })
end

return M
