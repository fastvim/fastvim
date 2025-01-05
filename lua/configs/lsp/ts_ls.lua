local ts = {}

ts.setup = function(capabilities, on_attach)
  require('lspconfig').ts_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach, 
    settings = {
      javascript = {
        format = {
          semicolons = "ignore", 
        },
      },
      typescript = {
        format = {
          semicolons = "ignore",
        },
      },
    },
    init_options = {
      hostInfo = "neovim", 
    },
     cmd = { 
      'typescript-language-server', 
      '--stdio' 
    },
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    handlers = {
      ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
        result.diagnostics = vim.tbl_filter(function(diagnostic)
          return diagnostic.severity ~= vim.diagnostic.severity["hint"] 
        end, result.diagnostics)
        vim.lsp.handlers["textDocument/publishDiagnostics"](nil, result, ctx, config)
      end,
    },
  }
end

return ts

