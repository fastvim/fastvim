local M = {}

M.setup = function(capabilities)
  require('lspconfig').ts_ls.setup {
    capabilities = capabilities,
    settings = {
      javascript = {
        format = {
          semicolons = "ignore", -- example setting
        },
      },
      typescript = {
        format = {
          semicolons = "ignore", -- example setting
        },
      },
    },
  }
end

return M

