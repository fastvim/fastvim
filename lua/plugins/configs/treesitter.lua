require("nvim-treesitter.configs").setup {
  ensure_installed = { "lua", "vim", "vimdoc", "html", "css", "typescript", "javascript", "go", "cpp", "haskell", "c", "rust", "scala" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}
