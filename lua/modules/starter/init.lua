local M = {}

local function create_java_class()
    local file_path = vim.api.nvim_buf_get_name(0)
    if not file_path:match("%.java$") then return end

    local file_content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    if #file_content > 0 and not (file_content[1] == "") then return end

    local file_name = file_path:match("([^/]+)%.java$")
    if not file_name then return end

    local class_template = "public class " .. file_name .. " {\n\n}"
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(class_template, "\n"))
end

function M.setup()
    if vim.g.auto_create_java_class == false then return end
    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*.java",
        callback = create_java_class,
    })
end

return M

