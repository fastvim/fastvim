require "mappings"
require "commands"
require "options"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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

local is_windows = vim.fn.has("win32") == 1
local user_config_path = is_windows and (vim.fn.stdpath("data"):gsub("nvim", "") .. "fastvim") or (vim.fn.stdpath("config"):gsub("nvim", "") .. "fastvim")

if not vim.loop.fs_stat(user_config_path) then
  vim.fn.mkdir(user_config_path, "p")
end

local function load_user_config()
  local config_file = user_config_path .. "/init.lua"
  if vim.loop.fs_stat(config_file) then
    -- Verificar se Lazy.nvim está instalado
    local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazy_path) then
      vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_path,
      }
    end
    vim.opt.rtp:prepend(lazy_path) 

    dofile(config_file) 
    return true
  else
    local default_config = [[
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("Instalando Lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = { lazy = true },
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", 
})
]]

    -- Criar o arquivo de configuração padrão
    local file = io.open(config_file, "w")
    file:write(default_config)
    file:close()

    -- Carregar a configuração após criá-la
    dofile(config_file)
    return true
  end
  return false
end

if not load_user_config() then
  local plugins = require "plugins"
  require("lazy").setup(plugins, require "lazy_config")
  vim.cmd "syntax enable"
  vim.cmd "colorscheme nekonight-moon"
  require("lazygrep").setup()
end

