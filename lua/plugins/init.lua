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
    "OXY2DEV/markview.nvim",
    lazy = false,      

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function ()
      require('configs.editor.markeview')
    end
  },
  {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function ()
    require('configs.todo-comments')
  end
},
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
    "nvim-neorg/neorg",
    lazy = false,
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {}, -- Load all default settings
                ["core.concealer"] = {}, -- Enable icons and rich text rendering
                ["core.dirman"] = { -- Manage Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/neorg/notes", 
                        },
                        default_workspace = "notes",
                    },
                },
            },
        }
    end,
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
    "BrunoCiccarino/lazygrep.nvim"
  },
  {
    "azratul/live-share.nvim",
    dependencies = {
      "jbyuki/instant.nvim",
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require('configs.lualine')
    end,
  },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require('configs.themery')
    end 
  },
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    config = function()
      require('configs.yazi')
    end
  },
  {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         
    "sindrets/diffview.nvim",        
    "nvim-telescope/telescope.nvim", 
    "ibhagwan/fzf-lua",              
    "echasnovski/mini.pick",         
  },
  config = function ()
    require('configs.git.neogit')
  end
},
  {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = {
    'DiffviewFileHistory', 'DiffviewOpen', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh'
  }
  },
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    dependencies = {
      { "nvim-telescope/telescope.nvim", optional = true },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("ht")
      end
    end,
  },
  {
    "mrcjkb/haskell-snippets.nvim",
    dependencies = { "L3MON4D3/LuaSnip" },
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    config = function()
      local haskell_snippets = require('haskell-snippets').all
      require('luasnip').add_snippets('haskell', haskell_snippets, { key = 'haskell' })
    end,
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
    "nvimdev/dashboard-nvim",
    config = function()
      require('configs.ui.dashboard-nvim')
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('configs.null-ls').setup()
    end,
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
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
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

  -- we use cmp plugin only when in insert mode
  -- so lets lazyload it at InsertEnter event, to know all the events check h-events
  -- completion , now all of these plugins are dependent on cmp, we load them after cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",

      "rafamadriz/friendly-snippets",

      {
        "L3MON4D3/LuaSnip",
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
        end,
      },

      -- autopairs , autocompletes ()[] etc
      -- {
    -- "windwp/nvim-autopairs",
    -- config = function()
        -- Require and setup nvim-autopairs
      --  local npairs = require("nvim-autopairs")
       -- npairs.setup({
         --   check_ts = true, -- Enable treesitter integration if needed
       -- })

        -- Remove the backtick rule explicitly
       -- local Rule = require('nvim-autopairs.rule')
       -- npairs.remove_rule('`') -- Try removing directly
       -- npairs.add_rule(Rule('`', '')) -- Add an empty rule as a fallback

        -- nvim-cmp integration
       -- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
       -- local cmp = require "cmp"
       -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    -- end,
     -- },
    },
    -- made opts a function cuz cmp config calls cmp module
    -- and we lazyloaded cmp so we dont want that file to be read on startup!
    opts = function()
      return require ('configs.cmp')
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
    "stevearc/conform.nvim",
    lazy = true,
    opts = require ('configs.conform'),
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

  -- files finder etc
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = require ('configs.telescope'),
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      { "mrcjkb/neotest-haskell" },
    },
    opts = {
      adapters = {
        ["neotest-haskell"] = {},
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },
}
