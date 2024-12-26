local M = {}

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


M.setup_lsp_servers = function()
  local lua = require 'plugins.configs.lsp.lua'
  local go = require 'plugins.configs.lsp.go'
  local ts_ls = require 'plugins.configs.lsp.ts_ls'  
  local html = require 'plugins.configs.lsp.html'
  local cssls = require 'plugins.configs.lsp.cssls'
  local clangd = require 'plugins.configs.lsp.clangd'
  
  lua.setup(M.capabilities)
  go.setup(M.capabilities)
  ts_ls.setup(M.capabilities)
  html.setup(M.capabilities)
  cssls.setup(M.capabilities)
  clangd.setup(M.capabilities)
end

return M

