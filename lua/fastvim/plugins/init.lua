return {
  {
    "BrunoCiccarino/nekonight",
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    opts = {},
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    config = function()
      require("typescript-tools").setup {}
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-ts-autotag").setup {
        filetypes = { "html", "xml", "javascript", "typescript", "tsx", "jsx", "vue" },
        enable_check_bracket_line = false,
        autotag = {
          enable = true,
        },
      }
    end,
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
  },
  {
    "mfussenegger/nvim-jdtls",
    lazy = false,
  },
  {
    "echasnovski/mini.statusline",
    config = function()
      require("mini.statusline").setup { set_vim_settings = false }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("ibl").setup {
        indent = { char = "│" },
        scope = { char = "│", highlight = "Comment" },
      }
    end,
  },
  require "fastvim.configs.plenary",
  require "fastvim.configs.mini",
  require "fastvim.configs.telescope",
  require "fastvim.configs.mason",
  require "fastvim.configs.bufferline",
  require "fastvim.configs.neo-tree",
  require "fastvim.configs.toggleterm",
  require "fastvim.configs.neokinds-config",
  require "fastvim.configs.treesitter",
  require "fastvim.configs.conform",
  require "fastvim.configs.lsp",
  require "fastvim.configs.ui",
  require "fastvim.configs.blink-cmp",
  require "fastvim.configs.colorful-menu",
}
