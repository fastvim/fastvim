
local function get_config_directory()
  local home = vim.fn.expand('$HOME')
  local appdata = vim.fn.getenv('APPDATA')
  local config_dir

  if vim.fn.has('unix') == 1 then
    config_dir = home .. '/.fast.d'
  elseif vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    config_dir = appdata .. '\\.fast.d'
  else
    config_dir = nil
  end

  return config_dir
end

local function load_config(config_dir)
  local Logger = require('modules.logger.init')
  
  if config_dir and vim.fn.isdirectory(config_dir) == 1 then
    local files = vim.fn.glob(config_dir .. '/*', false, true)
    
    if #files > 0 then
      for _, file in ipairs(files) do
        local ext = vim.fn.fnamemodify(file, ':e')
        
        if ext == 'lua' then
          dofile(file)
        end
      end
    else
      Logger.error("No configuration files found in: " .. config_dir)
    end
  else
    Logger.error("Configuration directory does not exist: " .. config_dir)
  end
end

local function init_config()
  local Logger = require('modules.logger.init')
  require('modules.handlers.init')
  require('configs.editor.conform')
  local config_dir = get_config_directory()
  
  if config_dir then
    load_config(config_dir)
  else
    Logger.error("Unable to determine config directory.")
  end
end

init_config()
