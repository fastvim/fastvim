local htmll = {}

htmll.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.html.setup {
    capabilities = capabilities,
  }
end

return htmll

