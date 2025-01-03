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


require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<C-q>"] = require('telescope.actions').close,
            },
        },
    },
})

