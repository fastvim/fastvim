-- ~/.config/nvim/lua/plugins/configs/lsp/init.lua
local M = {}

-- Define the capabilities for LSP
M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- Function to set up all LSP servers
M.setup_lsp_servers = function()
  local lua = require 'plugins.configs.lsp.lua'
  local go = require 'plugins.configs.lsp.go'
  local ts_ls = require 'plugins.configs.lsp.ts_ls'  -- Updated for ts_ls instead of tsserver
  local html = require 'plugins.configs.lsp.html'
  local cssls = require 'plugins.configs.lsp.cssls'

  -- Setup each LSP server
  lua.setup(M.capabilities)
  go.setup(M.capabilities)
  ts_ls.setup(M.capabilities)
  html.setup(M.capabilities)
  cssls.setup(M.capabilities)
end

return M

