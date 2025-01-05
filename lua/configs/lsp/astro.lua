local astro = {}

astro.settings = {
  disable_treesitter = false,
  treesitter_grammars = "astro",
  disable_lsp = false,
  lsp_name = "astro",
}

astro.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.astro.setup {
    capabilities = capabilities,
    filetypes = { 'astro', 'typescript', 'javascript' },
    root_dir = lspconfig.util.root_pattern('astro.config.*', '.git'),
    settings = {
      astro = {
        languageServer = {
          diagnostics = {
            enable = true,
          },
          format = {
            enable = true,
          },
        },
      },
    },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true
    end,
  }
end

return astro

