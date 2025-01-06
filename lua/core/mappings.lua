local map = vim.keymap.set
local cmd = vim.cmd
local input = vim.api.nvim_input 

local up = require('core.update')
local fn = require('core.functions')

-- see doc 
map('n', '<C-d>', function() fn.open_docs() end, { noremap = true, silent = true, desc = 'Split window and open FastVim user manual' })

-- updates 
map('n', '<leader>fu', function() up.update_to_latest() end, { noremap = true, silent = true, desc = 'Update to the latest version' })
map('n', '<leader>fs', function() up.update_to_stable() end, { noremap = true, silent = true, desc = 'Update to the stable version' })

map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>")
map("n", "<C-z>", "<cmd> undo <CR>")

-- nvimtree
map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>")
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>")

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- format
map("n", "<leader>fm", function()
  require("conform").format()
end)

local function move_line_up()
  cmd('move .-2')
end

local function move_line_down()
  cmd('move .+1')
end

local function select_lines_up()
  input('<Esc><S-v><Up>')
  input('gi')
end

local function select_lines_down()
  input('<Esc><S-v><Down>')
  input('gi')
end

-- Key bindings for insert mode
map('i', '<A-Up>', '', { noremap = true, silent = true, callback = move_line_up })
map('i', '<A-Down>', '', { noremap = true, silent = true, callback = move_line_down })
map('i', '<C-Up>', '', { noremap = true, silent = true, callback = select_lines_up })
map('i', '<C-Down>', '', { noremap = true, silent = true, callback = select_lines_down })

-- neorg 
local neorg_leader = "<leader>n" -- Set a leader key for Neorg mappings

map("n", neorg_leader .. "w", "<cmd>Neorg workspace notes<CR>", { desc = "Switch to Neorg workspace" })
map("n", neorg_leader .. "n", "<cmd>Neorg index<CR>", { desc = "Open Neorg index" })
map("n", neorg_leader .. "t", "<cmd>Neorg toggle-concealer<CR>", { desc = "Toggle concealer" })
map("n", neorg_leader .. "h", "<cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_toggle<CR>", { desc = "Toggle TODO state" })
map("n", neorg_leader .. "c", "<cmd>Neorg toggle-concealer<CR>", { desc = "Toggle concealer visibility" })
