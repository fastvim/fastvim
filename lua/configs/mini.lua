require('mini.pairs').setup({
  modes = { insert = true, command = false, terminal = false }, 
  mappings = { 
    ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
    ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
    ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
    ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
  },
})

