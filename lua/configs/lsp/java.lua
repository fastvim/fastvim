local java = {}

java.settings = {
  disable_treesitter = false,
  treesitter_grammars = "java",

  lsp_name = "jdtls",
  lsp_config = nil,

  disable_formatting = false,
  formatting_package = nil,
  formatting_provider = "builtins.formatting.google_java_format",
  formatting_config = nil,
}

java.autocmds = {
  {
    "BufWinEnter",
    "*.java",
    function()
      if not java.settings.disable_lsp then
        require("lsp.utils").use_lsp_mason(java.settings.lsp_name, {
          config = java.settings.lsp_config,
        })
      end

      if not java.settings.disable_treesitter then
        require("lsp.utils").use_tree_sitter(java.settings.treesitter_grammars)
      end

      if not java.settings.disable_formatting then
        require("lsp.utils").use_null_ls(
          java.settings.diagnostics_package,
          java.settings.formatting_provider,
          java.settings.formatting_config
        )
      end
    end,
    once = true,
  },
}

return java
