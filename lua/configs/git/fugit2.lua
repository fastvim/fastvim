local fugit2 = require("fugit2")

---@class Fugit2Config
---@field width integer|string Main popup width
---@field max_width integer|string Main popup popup width when expand patch view
---@field min_width integer File view width when expand patch view
---@field content_width File view content width
---@field height integer|string Main popup height
---@field show_patch boolean show patch for active file when open fugit2 main window
---@field libgit2_path string? path to libgit2 lib, default: "libgit2"
---@field gpgme_path string? path to gpgme lib, default: "gpgme"
---@field external_diffview boolean whether to use external diffview.nvim or Fugit2 implementation
---@field blame_priority integer priority of blame virtual text
---@field blame_info_width integer width of blame hunk detail popup
---@field blame_info_height integer height of blame hunk detail popup
---@field colorscheme string? custom color scheme override

fugit2.setup({
  layout = {
    width = 0.9,      -- 90% of the screen width
    height = 0.8,     -- 80% of the screen height
  },
  keymaps = {
    toggle = "<leader>fg",
  },
  command = "Fugit",
  logs = {
    show_graph = true,
  },
})

vim.keymap.set("n", "<leader>fg", ":Fugit2<CR>", { desc = "Toggle fugit2 interface" })
vim.keymap.set("n", "<leader>fd", ":Fugit2Diff<CR>", { desc = "Open Fugit2 Diff" })
vim.keymap.set("n", "<leader>fc", ":Fugit2Graph<CR>", { desc = "Open Fugit2 Graph" })
