local M = {}

M.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.html.setup {
    capabilities = capabilities,
  }
end

return M

