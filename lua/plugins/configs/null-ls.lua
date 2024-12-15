local M = {}

local function setup_null_ls()
    local null_ls = require('null-ls')

    null_ls.setup {

        sources = {},
    }
end

function M.register_null_ls_source(source)
    local null_ls = require('null-ls')
    null_ls.register(source)
end

function M.setup()
    setup_null_ls()
end

return M
