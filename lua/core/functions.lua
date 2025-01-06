local functions = {}

-- Open FastVim user manual
functions.open_docs = function()
    local docs_path = vim.fn.stdpath("config") .. "/doc/getting_started.norg"
  
    if not vim.loop.fs_stat(docs_path) then
      vim.notify("The documentation file was not found: " .. docs_path, vim.log.levels.ERROR)
      return
    end
  
    vim.cmd("split " .. docs_path)
  
    local bufnr = vim.fn.bufnr(docs_path)
    if bufnr > 0 then
      vim.api.nvim_buf_call(bufnr, function()
    
        vim.fn.cursor({ 1, 1 }) 
  
        vim.opt_local.modified = false
        vim.opt_local.modifiable = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local.foldcolumn = "0"
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.colorcolumn = "0"
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = "n"
        vim.opt_local.textwidth = 100
        vim.opt_local.rightleft = false
      end)
    end
  end
  
return functions
