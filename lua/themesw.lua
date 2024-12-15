local themes = { 'catppuccin-macchiato', 'catppuccin-frappe', 'catppuccin-mocha' }  
local current_theme = 1  

function SwitchTheme()
  vim.cmd('colorscheme default')
  
  
  vim.cmd('colorscheme ' .. themes[current_theme])
  
 
  current_theme = current_theme % #themes + 1
end

