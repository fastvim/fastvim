return {
  {
    lazy = true,
    "nvim-lua/plenary.nvim",
    config = function ()
      require('configs.plenary')
    end
  },
  { 
    "echasnovski/mini.nvim", 
    version = '*',
    config = function ()
      require('configs.mini')
    end,
  },
    {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",  
    },
    config = function()
     require("nvim-ts-autotag").setup({
        filetypes = { "html", "xml", "javascript", "typescript", "tsx", "jsx", "vue" },
        enable_check_bracket_line = false, 
        autotag = {
          enable = true, 
        },

      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
--      "Jezda1337/nvim-html-css",
      "rafamadriz/friendly-snippets",

      {
        "L3MON4D3/LuaSnip",
        config = function()
          local ls = require("luasnip")
            ls.config.set_config({
              history = true,
              enable_autosnippets = true,
            })
          require("modules.snippets.snippets")
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },
    },
    opts = function()
      return require ('configs.cmp')
    end,
  },
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
  
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    config = function ()
      require('configs.blink-cmp')
    end,
  },
  {
    "BrunoCiccarino/neokinds",
    config = function ()
      require('configs.neokinds')
    end    
  },
  {
    "xzbdmw/colorful-menu.nvim",
    config = function ()
      require('configs.colorful-menu')
    end
  },
  {
    "BrunoCiccarino/webdev.nvim",
    dependencies = { "ColinKennedy/mega.cmdparse", "ColinKennedy/mega.logging", "stevearc/dressing.nvim" }
  },
  {
  "jackplus-xyz/monaspace.nvim",
  lazy = false,
  config = function ()
    require('configs.editor.monospace')
    end
  },
  {
    "folke/zen-mode.nvim",
    config = function ()
      require('configs.ui.zenmode')
    end
  },
  {
    'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
  config = function()
    require('typescript-tools').setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'angular'
      },
      settings = {
        tsserver_plugins = {
          '@vue/typescript-plugin',
        },
        jsx_close_tag = {
          enable = true,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
      },
    }
  end,
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
  },
  {
    'goolord/alpha-nvim',
    config = function ()
      require('configs.ui.alpha')
    end
  };
  {
    "mfussenegger/nvim-jdtls",
    lazy = false
  },
  {
      "okuuva/auto-save.nvim",
      version = '^1.0.0', 
      cmd = "ASToggle", 
      event = { "InsertLeave", "TextChanged" },    
      config = function ()
        require('configs.editor.autosave')
      end
  },
  {
  'stevearc/conform.nvim',
  opts = function ()
    require('configs.conform')
  end
  },
  {
    "BrunoCiccarino/nekonight",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'jmbuhr/otter.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function ()
      require('configs.otter')
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require('configs.lualine')
    end,
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    config = function()
      require('configs.yazi')
    end
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require('configs.editor.neoscroll')
    end
  },
  {
    "akinsho/toggleterm.nvim",
    priority = 100,
    config = function ()
      require('configs.editor.toggleterm')
    end
  },
  {
    'folke/neodev.nvim',
    config = function()
      require('configs.neodev').setup()
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function ()
      require('configs.nvim-tree')
    end
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require ('configs.treesitter')
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    opts = require ('configs.bufferline'),
  },

  {
    "echasnovski/mini.statusline",
    config = function()
      require('mini.statusline').setup { set_vim_settings = false }
    end,
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    opts = {
      ensure_installed = {
        "clangd",
        "golps",
        "ts_ls",
        "jdtls"
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require ('configs.lspconfig')
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", 
    build = "make install_jsregexp"
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('ibl').setup {
        indent = { char = "│" },
        scope = { char = "│", highlight = "Comment" },
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require ('configs.telescope'),
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
