require('modicator').setup({
  show_warnings = false,
  highlights = {
    defaults = {
      bold = false,
      italic = false,
    },
    use_cursorline_background = false,
  },
  integration = {
    lualine = {
      enabled = true,
      mode_section = nil,
      highlight = 'bg',
    },
  },
})
