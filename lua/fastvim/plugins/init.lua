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
     },
     config = function()
       require('fastvim.core.lsp')
     end,
   },
   {
    'goolord/alpha-nvim',
    config = function ()
      require('fastvim.core.ui')
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
    "folke/zen-mode.nvim",
    config = function ()
      require('fastvim.core.ui')
    end
  },

}