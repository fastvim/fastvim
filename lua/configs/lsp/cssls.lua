local css = {}

css.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.cssls.setup {
    capabilities = capabilities,
  }
end

return css

