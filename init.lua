require "fastvim.core.commands"
require "fastvim.core.options"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)
local plugins = require "fastvim.plugins"

require("lazy").setup(plugins)

vim.cmd "syntax enable"
vim.cmd "colorscheme nekonight-deep-ocean"
require "fastvim.core.mappings"
