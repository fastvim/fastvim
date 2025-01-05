local svelte = {}

svelte.settings = {
  disable_treesitter = false,
  treesitter_grammars = "svelte",
  disable_lsp = false,
  lsp_name = "svelte",
}

svelte.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.svelte.setup {
    capabilities = capabilities,
    filetypes = { 'svelte', 'typescript', 'javascript', 'css', 'html' },
    root_dir = lspconfig.util.root_pattern('svelte.config.*', '.git'),
    settings = {
      svelte = {
        plugin = {
          typescript = {
            enable = true,
            diagnostics = true,
            hover = true,
          },
          css = {
            enable = true,
          },
          html = {
            enable = true,
          },
          svelte = {
            enable = true,
          },
        },
        telemetry = {
          enabled = false,
        },
      },
    },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true
    end,
  }
end

return svelte

