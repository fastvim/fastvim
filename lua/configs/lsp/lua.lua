local M = {}

M.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.lua_ls.setup {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
      },
    },
  }
end

return M

