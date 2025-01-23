return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BrunoCiccarino/neokinds',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    },
    opts = {
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        icon = {
          folder_closed = neokinds.config.icons.folders.closed,
          folder_open = neokinds.config.icons.folders.open,
          folder_empty = neokinds.config.icons.folders.empty,
          default = neokinds.config.icons.files.default,
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
        components = {
          icon = function(config, node, state)
            return neokinds.icon(config, node, state)
          end,
        },
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    },
  }
  