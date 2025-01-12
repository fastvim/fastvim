local ok, ls = pcall(require, "luasnip")
if not ok then
  print("LuaSnip not loaded!")
  return
end
local map = vim.api.nvim_set_keymap

ls.config.set_config({
  history = true,
  enable_autosnippets = true,
})

require('modules.snippets.snippets')

map("s", "<Tab>", "luasnip.expand_or_jump()", { noremap = true, silent = true }) 
map("i", "<S-Tab>", "luasnip.jump(-1)", { noremap = true, silent = true })
map("s", "<S-Tab>", "luasnip.jump(-1)", { noremap = true, silent = true })

