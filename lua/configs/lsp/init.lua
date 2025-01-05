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
  local vue = require 'configs.lsp.vue'
  local angular = require 'configs.lsp.angular'
  local astro = require 'configs.lsp.astro'
  local svelte = require 'configs.lsp.svelte'
  local python = require 'configs.lsp.python'

  lua.setup(M.capabilities)
  go.setup(M.capabilities)
  ts_ls.setup(M.capabilities)
  html.setup(M.capabilities)
  cssls.setup(M.capabilities)
  clangd.setup(M.capabilities)
  vue.setup(M.capabilities)
  angular.setup(M.capabilities)
  astro.setup(M.capabilities)
  svelte.setup(M.capabilities)
  python.setup(M.capabilities)

  local java = require('configs.lsp.java')  
  vim.cmd("doautocmd BufWinEnter *.java")  

end

return M
