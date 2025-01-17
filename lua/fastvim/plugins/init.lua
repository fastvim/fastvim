return {
    {
      lazy = true,
      "nvim-lua/plenary.nvim",
      config = function ()
        require('fastvim.configs.plenary')
      end
    },
    { 
      "echasnovski/mini.nvim", 
      version = '*',
      config = function ()
        require('fastvim.configs.mini')
      end,
    },
    {
        "BrunoCiccarino/nekonight",
        lazy = false,
        otps = {},
    },
    {
        "BrunoCiccarino/neokinds",
        config = function ()
          require('fastvim.configs.neokinds')
        end,    
    },
    { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
  { 
    'folke/todo-comments.nvim', 
    event = 'VimEnter', 
    dependencies = { 'nvim-lua/plenary.nvim' }, 
    opts = { signs = false } 
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
     'neovim/nvim-lspconfig',
     dependencies = {
       { 'williamboman/mason.nvim', opts = {} },
       'williamboman/mason-lspconfig.nvim',
       'WhoIsSethDaniel/mason-tool-installer.nvim',
       { 'j-hui/fidget.nvim', opts = {} },
       'hrsh7th/cmp-nvim-lsp',
       'hrsh7th/nvim-cmp', 
       'hrsh7th/cmp-buffer', 
       'hrsh7th/cmp-path', 
       'hrsh7th/cmp-cmdline', 
       'saadparwaiz1/cmp_luasnip', 
       'L3MON4D3/LuaSnip', 
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
          "rafamadriz/friendly-snippets",
    
          {
            "L3MON4D3/LuaSnip",
            config = function()
              local ls = require("luasnip")
                ls.config.set_config({
                  history = true,
                  enable_autosnippets = true,
                })
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = function()
          return require ('fastvim.configs.lsp')
        end,
      },    
     config = function()
       require('fastvim.configs.lsp')
     end,
   },
   {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
   {
    'goolord/alpha-nvim',
    config = function ()
      require('fastvim.configs.ui')
    end
  },
  {
    'pmizio/typescript-tools.nvim',
    opts = {},
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
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
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
  },
  {
    "mfussenegger/nvim-jdtls",
    lazy = false
  },
  {
    "echasnovski/mini.statusline",
    config = function()
      require('mini.statusline').setup { set_vim_settings = false }
    end,
  },
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
  
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    config = function ()
      require('fastvim.configs.blink-cmp')
    end,
  },
  {
    "xzbdmw/colorful-menu.nvim",
    config = function ()
      require('fastvim.configs.colorful-menu')
    end
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
    opts = require ('fastvim.configs.telescope'),
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
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    opts = require ('fastvim.configs.bufferline'),
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "BrunoCiccarino/neokinds", 
      "MunifTanjim/nui.nvim",
        },
    config = function ()
        require('fastvim.configs.neo-tree')
    end
    },
}