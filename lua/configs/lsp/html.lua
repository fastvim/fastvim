local html5 = {}

html5.settings = {
  disable_treesitter = false,
  treesitter_grammars = "html",
  lsp_name = "html",
}


html5.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  vim.lsp.set_log_level('debug')
  lspconfig.html.setup {
    root_dir = function(fname)
      return lspconfig.util.find_git_ancestor(fname)
        or lspconfig.util.path.dirname(fname) 
    end,
    capabilities = capabilities,
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

