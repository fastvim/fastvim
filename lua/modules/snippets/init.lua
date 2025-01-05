local ls = require("luasnip")

ls.config.set_config({
  history = true,
  enable_autosnippets = true,
})

require('modules.snippets.snippets')

vim.api.nvim_set_keymap("s", "<Tab>", "luasnip.expand_or_jump()", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "luasnip.jump(-1)", { noremap = true, silent = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "luasnip.jump(-1)", { noremap = true, silent = true })

