local fugit2 = require("fugit2")

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
