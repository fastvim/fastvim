local M = {}

function M.setup()
  require("neodev").setup({
    lsp = {
       setup_jsonls = true,  
      lspconfig = true,     
    },
    
    library = {
      enabled = true, 
        
      runtime = true, 
      types = true, 
      plugins = { "nvim-treesitter", "nvim-lspconfig", "plenary.nvim" },  

    },
    pathStrict = true,
  })
end

return M