local M = {}

function M.setup()
  require("neodev").setup({
    lsp = {
       setup_jsonls = true,  -- Configure jsonls automatically
      lspconfig = true,     -- Enables integration with lspconfig
    },
    -- Configure library integration
    library = {
      enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
        -- these settings will be used for your Neovim config directory
      runtime = true, -- runtime path
      types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
      plugins = { "nvim-treesitter", "nvim-lspconfig", "plenary.nvim" },  -- Extra plugins

    },
    pathStrict = true,
  })
end

return M
