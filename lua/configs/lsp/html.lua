local htmll = {}

htmll.setup = function(capabilities)
  local lspconfig = require('lspconfig')

  lspconfig.html.setup {
    capabilities = capabilities or vim.lsp.protocol.make_client_capabilities(),
    on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end,
    settings = {
      html = {
        format = {
          enable = true,
        },
        hover = {
          documentation = true,
          references = true,
        },
      },
    },
  }
end

return htmll

