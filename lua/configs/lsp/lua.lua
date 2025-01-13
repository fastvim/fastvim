local lua = {}

lua.settings = {
   disable_treesitter = false,
   treesitter_grammars = "lua",
   lsp_name = "lua_ls",
}

lua.setup = function(capabilities)
  local lspconfig = require 'lspconfig'

  lspconfig.lua_ls.setup {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = { 
          globals = { 
            "vim" 
          } 
        },
        format = {
          enable = true,
        },
      },
    },
  }
end

return lua

