local M = {}

M.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.cssls.setup {
    capabilities = capabilities,
  }
end

return M

