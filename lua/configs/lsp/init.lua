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
  local lua = require 'configs.lsp.lua'
  local go = require 'configs.lsp.go'
  local ts_ls = require 'configs.lsp.ts_ls'  
  local html = require 'configs.lsp.html'
  local cssls = require 'configs.lsp.cssls'
  local clangd = require 'configs.lsp.clangd'
  
  lua.setup(M.capabilities)
  go.setup(M.capabilities)
  ts_ls.setup(M.capabilities)
  html.setup(M.capabilities)
  cssls.setup(M.capabilities)
  clangd.setup(M.capabilities)
end

return M

