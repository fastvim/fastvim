local M = {}

define_colorscheme = function(theme_name)
    local Logger = require('modules.logger.init')
    if type(theme_name) ~= "string" then
        Logger.error("Colorscheme name must be a string")
    end

    local success, _ = pcall(vim.cmd, "colorscheme " .. theme_name)
    if not success then
        Logger.error("Failed to apply colorscheme: " .. theme_name)
    end
end

vim.g.define_colorscheme = define_colorscheme

return M
