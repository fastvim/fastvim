require('mini.pairs').setup({
  modes = { insert = true, command = false, terminal = false }, 
  mappings = { 
    ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
    ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },
    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },
  },
})

require('mini.icons').setup({
    style = 'glyph',

    default   = {},
    directory = {},
    extension = {},
    file      = {},
    filetype  = {},
    lsp       = {},
    os        = {},

    use_file_extension = function(ext, file) return true end,
})

