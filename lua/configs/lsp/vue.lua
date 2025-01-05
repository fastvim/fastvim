local vue = {}

vue.settings = {
  disable_treesitter = false,
  treesitter_grammars = "vue",
  disable_lsp = false,
  lsp_name = "volar",
}

vue.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.volar.setup {
    capabilities = capabilities,
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    settings = {
      volar = {
        diagnostics = {
          enable = true,
        },
        completion = {
          autoImport = true,
        },
        format = {
          enable = true,
        },
        telemetry = {
          enable = false,
        },
      },
    },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  }
end

return vue

