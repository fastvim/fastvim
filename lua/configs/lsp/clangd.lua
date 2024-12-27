local cc = {}

cc.setup = function(on_attach, capabilities)
  local lspconfig = require("lspconfig")
  
  lspconfig.clangd.setup({
    cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed", "--header-insertion=never" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern(".clangd", "compile_commands.json", "compile_flags.txt", ".git"),
    on_attach = nil,
    capabilities = capabilities,
    init_options = {
      clangdFileStatus = true, 
    },
  })
end

return cc

