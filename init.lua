require "core.commands"
require "core.options"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim" -- path where its going to be installed

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

local plugins = require "plugins"

require("lazy").setup(plugins, require "lazy_config")
vim.cmd "syntax enable"
vim.cmd "colorscheme nekonight-dracula"
require('core.mappings')
require('modules.loader.init')
require('modules.starter.init').setup()
require('modules.handlers.init')
require('core.functions')

vim.g.auto_create_java_class = false

require('modules.lazyreplace.init').setup()
require('modules.snippets.init')
