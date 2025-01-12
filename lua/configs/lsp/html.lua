local html5 = {}

html5.settings = {
  disable_treesitter = false,
  treesitter_grammars = "html",
  disable_lsp = false,
  lsp_name = "html",
}

html5.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.html.setup {
    capabilities = capabilities or vim.lsp.protocol.make_client_capabilities(),
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
    on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end,
  }
end

return html5

