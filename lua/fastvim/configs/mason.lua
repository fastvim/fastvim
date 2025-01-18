return {
  "williamboman/mason.nvim",
  dependecies = {
    "williamboman/mason-lspconfig.nvim",
  },
  build = ":MasonUpdate",
  cmd = { "Mason", "MasonInstall" },
  opts = {
    ensure_installed = {
      "clangd",
      "golps",
      "ts_ls",
      "jdtls",
    },
  },
  config = function()
    local handlers = require "fastvim.core.handlers"
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = { callSnippet = "Replace" },
          },
        },
      },
    }

    require("mason").setup {
      ensure_installed = vim.tbl_keys(servers),
    }
    require("mason-lspconfig").setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          on_attach = handlers.lsp.on_attach,
          capabilities = handlers.lsp.capabilities,
          settings = servers[server_name],
        }
      end,
    }
  end,
}
