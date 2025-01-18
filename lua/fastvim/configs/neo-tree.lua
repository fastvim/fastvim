return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BrunoCiccarino/neokinds",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
  },
  -- Did it this way so i dont need to change it too much now
  -- TODO: We should probably take a look into this later
  opts = function()
    local neokinds = require "neokinds"
    return {
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
            ["\\"] = "close_window",
          },
        },
      },
    }
  end,
}
