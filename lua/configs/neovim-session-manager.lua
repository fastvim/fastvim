local session_manager = require('session_manager')
local Path = require('plenary.path')

session_manager.setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- Path to save sessions
  path_replacer = '__', -- Replace `/` in session names
  colon_replacer = '++', -- Replace `:` in session names
  autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir, -- Sets autoload behavior
  autosave_last_session = true, -- Automatically save last session when exiting Neovim
  autosave_ignore_not_normal = true, -- Skip save when current layout is not "normal"
  autosave_ignore_dirs = {}, -- Directories to ignore for autosave
  autosave_ignore_filetypes = {}, -- File types ignored when saving sessions
  autosave_ignore_buftypes = {}, -- Buffer types ignored when saving sessions
  max_path_length = 80, -- Maximum path length for session name
})

vim.keymap.set('n', '<Leader>sl', function() session_manager.load_session() end, { desc = 'Carregar sessão' })
vim.keymap.set('n', '<Leader>ss', function() session_manager.save_current_session() end, { desc = 'Salvar sessão atual' })
vim.keymap.set('n', '<Leader>sd', function() session_manager.delete_session() end, { desc = 'Deletar sessão atual' })
vim.keymap.set('n', '<Leader>sc', function() session_manager.setup_autoload_mode('CurrentDir') end, { desc = 'Configurar autoload para CurrentDir' })
