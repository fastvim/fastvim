local M = {}

define_colorscheme = function(theme_name)
    if type(theme_name) ~= "string" then
        error("Colorscheme name must be a string")
    end

    local success, _ = pcall(vim.cmd, "colorscheme " .. theme_name)
    if not success then
        error("Failed to apply colorscheme: " .. theme_name)
    end
end

vim.g.define_colorscheme = define_colorscheme

return M

