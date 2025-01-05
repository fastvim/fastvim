local python = {}

python.settings = {
  disable_treesitter = false,
  treesitter_grammars = "python",
  disable_lsp = false,
  lsp_name = "pyright",
}

python.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.pyright.setup {
    capabilities = capabilities,
    filetypes = { 'python' },
    root_dir = lspconfig.util.root_pattern('pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git'),
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic", 
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = "workspace", 
        },
      },
    },
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false 
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  }
end

return python

