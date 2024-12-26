local M = {}

M.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
    end,
    settings = {
      gopls = {
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
          nilness = true,
          unusedwrite = true,
        },
        staticcheck = true,
        codelenses = {
          gc_details = true,
          test = true,
          regenerate_cgo = true,
          tidy = true,
          upgrade_dependency = true,
        },
      },
    },
  }
end

return M

