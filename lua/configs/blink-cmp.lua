local neokinds = require("neokinds")

require('blink-cmp').setup({
    completion = {
      list = {
        selection = {
          preselect = true, 
          auto_insert = false, 
        },
      },
      menu = {
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            draw = {
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
                },
            },
        },
    },
          keymap = {
            preset = 'enter',
        
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
        
            ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
            ['<C-y>'] = { 'select_and_accept' },
            ['<C-e>'] = { 'hide' },
        
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
        
            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        
            ['<Tab>'] = { 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        },
            
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = true,
      },
      snippets = {
        expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction) require('luasnip').jump(direction) end,
      },
    
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        cmdline = {},
      },
--    opts_extend = { "sources.default" },    
})
