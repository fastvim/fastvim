local neokinds = require("neokinds")

require('blink-cmp').setup({
  conclusion = {
    list = {
      selection = function(ctx)
        return ctx.mode == "cmdline" and "auto_insert" or "preselect"
      end,
    },
  },
  
  menu = {
    min_width = 20,
    border = "rounded",
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
    draw = {
      columns = {
        { "kind_icon" },
        { "label", gap = 1 },
        { "source" }
      },
      components = {
        label = {
          text = require("colorful-menu").blink_components_text,
          highlight = require("colorful-menu").blink_components_highlight,
        },
        kind_icon = {
          text = function(ctx)
            local icon = neokinds.config.completion_kinds[ctx.kind] or ""
            return icon .. " " .. (ctx.kind or "")
          end,
          highlight = function(ctx)
            return "CmpItemKind" .. (ctx.kind or "Default")
          end,
        },
        source = {
          text = function(ctx)
            local map = {
              ["lsp"] = "[]",
              ["path"] = "[󰉋]",
              ["snippets"] = "[]",
            }
            return map[ctx.item.source_id] or ""
          end,
          highlight = "BlinkCmpSource",
        },
      },
    },

  },

  documentation = {
    auto_show = true,
    auto_show_delay_ms = 100,
    update_delay_ms = 10,
    window = {
      max_width = math.min(80, vim.o.columns),
      border = "rounded",
    },
  },

  keymaps = {
    default = 'enter',
    ['<Up>'] = { 'select_previous', 'return' },
    ['<Down>'] = { 'select_next', 'return' },
    ['<C-Space>'] = { function(cmp) cmp.show({ sources = { 'snippets' } }) end },
    ['<C-y>'] = { 'select_and_accept' },
    ['<C-e>'] = { 'close' },
    ['<C-n>'] = { 'select_next', 'return' },
    ['<C-p>'] = { 'select_previous', 'return' },
    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    ['<Tab>'] = { 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },

  snippets = {
    expand = function(snippet)
      require('luasnip').lsp_expand(snippet)
    end,
    active = function(filter)
      if filter and filter.direction then
        return require('luasnip').jumpable(filter.direction)
      end
      return require('luasnip').in_snippet()
    end,
    jump = function(direction)
      require('luasnip').jump(direction)
    end,
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    cmdline = {},
  },
})

