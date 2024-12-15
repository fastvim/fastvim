local dashboard = require("dashboard")

dashboard.setup({
    theme = "doom",
    shortcut_type = "number",
    statusline = false,
    config = {
        header = {
            "",
            "",
            "",
            "███████╗ █████╗ ███████╗████████╗██╗   ██╗██╗███╗   ███╗",
            "██╔════╝██╔══██╗██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║",
            "█████╗  ███████║███████╗   ██║   ██║   ██║██║██╔████╔██║",
            "██╔══╝  ██╔══██║╚════██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║",
            "██║     ██║  ██║███████║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
            "╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
        },
        center = {
          {
              icon = "󰈞  ",
              desc = "Find File                              ",
              action = function()
                  vim.cmd("Telescope find_files")
              end,
          },
          {
              icon = "󰈢  ",
              desc = "Recently opened files                   ",
              action = function()
                  vim.cmd("Telescope oldfiles")
              end,
          },
          {
              icon = "󰬀  ",
              desc = "Project grep                            ",
              action = function()
                  vim.cmd("Telescope live_grep")
              end,
          },
          {
              icon = "  ",
              desc = "Open Nvim config                        ",
              action = function()
                  vim.cmd("tabnew $MYVIMRC | tcd %:p:h")
              end,
          },
          {
              icon = "  ",
              desc = "New file                                ",
              action = "enew",
              key = "e",
          },
          {
              icon = "󰗼  ",
              desc = "Quit Nvim                               ",
              action = "qa",
              key = "q",
          },
      },
      footer = {
          "✨ Happy coding ✨",
      },
    },
})

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<C-q>"] = require('telescope.actions').close,
            },
        },
    },
})
