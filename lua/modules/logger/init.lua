local Logger = {}

local levels = {
  INFO = vim.log.levels.INFO,
  ERROR = vim.log.levels.ERROR,
  WARN = vim.log.levels.WARN,
  DEBUG = vim.log.levels.DEBUG
}

function Logger.log(message, level)
  level = levels[level] or levels.INFO
  vim.notify("[FastVim] " .. message, level)
end

function Logger.info(message)
  Logger.log("INFO: " .. message, "INFO")
end

function Logger.error(message)
  Logger.log("ERROR: " .. message, "ERROR")
end

function Logger.warn(message)
  Logger.log("WARN: " .. message, "WARN")
end

function Logger.debug(message)
  Logger.log("DEBUG: " .. message, "DEBUG")
end

return Logger

