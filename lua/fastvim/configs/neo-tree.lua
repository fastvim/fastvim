return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<C-n>", ":Neotree toggle<CR>", desc = "Toggle NeoTree", silent = true },
  },
  opts = {
    options = {
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
        components = {
          icon = function(config, node, state)
            local webdevicons = require "nvim-web-devicons"
            local icon, icon_color = webdevicons.get_icon_color(node.name, node.ext, { default = true })
            return {
              text = icon or config.default,
              highlight = icon_color and { fg = icon_color } or nil,
            }
          end,
        },
        window = {
          mappings = {
            ["\\"] = "close_window",
          },
        },
      },
    },
  },
}
