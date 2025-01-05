local angular = {}

angular.settings = {
  disable_treesitter = false,
  treesitter_grammars = "html",
  disable_lsp = false,
  lsp_name = "angularls",
}

angular.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.angularls.setup {
    capabilities = capabilities,
    filetypes = { 'typescript', 'html', 'javascript', 'javascriptreact' },
    root_dir = lspconfig.util.root_pattern('angular.json'),
    settings = {
      angular = {
        languageService = {
          enable = true,
          completion = {
            autoImport = true,
          },
        },
      },
    },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  }
end

return angular

