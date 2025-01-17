-- Configuração do plugin alpha.nvim
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "",
    "",
    "",
    "███████╗ █████╗ ███████╗████████╗██╗   ██╗██╗███╗   ███╗",
    "██╔════╝██╔══██╗██╔════╝╚══██╔══╝██║   ██║██║████╗ ████║",
    "█████╗  ███████║███████╗   ██║   ██║   ██║██║██╔████╔██║",
    "██╔══╝  ██╔══██║╚════██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║",
    "██║     ██║  ██║███████║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
    "",
    "",
}

dashboard.section.buttons.val = {
    dashboard.button("f", "󰈞  Find File                              ", ":Telescope find_files<CR>"),
    dashboard.button("r", "󰈢  Recently opened files                   ", ":Telescope oldfiles<CR>"),
    dashboard.button("g", "󰬀  Project grep                            ", ":Telescope live_grep<CR>"),
    dashboard.button("c", "  Open Nvim config                        ", ":tabnew $MYVIMRC | tcd %:p:h<CR>"),
    dashboard.button("n", "  New file                                ", ":enew<CR>"),
    dashboard.button("q", "󰗼  Quit Nvim                               ", ":qa<CR>"),
}

dashboard.section.footer.val = {
    "✨ Happy coding ✨",
}

alpha.setup(dashboard.config)

return {
    window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
    },
    plugins = {
        options = {
            enabled = true,
            ruler = false,
            showcmd = false,
            laststatus = 0,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        todo = { enabled = false },
        kitty = {
            enabled = false,
            font = "+4",
        },
        alacritty = {
            enabled = false,
            font = "14",
        },
        wezterm = {
            enabled = false,
            font = "+4",
        },
        neovide = {
            enabled = false,
            scale = 1.2,
            disable_animations = {
                neovide_animation_length = 0,
                neovide_cursor_animate_command_line = false,
                neovide_scroll_animation_length = 0,
                neovide_position_animation_length = 0,
                neovide_cursor_animation_length = 0,
                neovide_cursor_vfx_mode = "",
            },
        },
    },
    on_open = function(win) end,
    on_close = function() end,
}
