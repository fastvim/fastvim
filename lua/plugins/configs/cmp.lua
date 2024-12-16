local cmp = require("cmp")
local luasnip = require("luasnip")

return {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),

    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    
    ["<CR>"] = cmp.mapping.confirm({ select = true }),

    ["<C-Space>"] = cmp.mapping.complete(),

    ["<C-e>"] = cmp.mapping.abort(),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },         -- LSP completion
    { name = "luasnip" },          -- Snippets
    { name = "buffer" },           -- Buffer words
    { name = "nvim_lua" },         -- nvim API completion
    { name = "path" },             -- Path completions
    { name = "calc" },             -- Mathematical calculations
    { name = "emoji" },            -- Emoji completions
  }),

  window = {
    completion = {
      border = "rounded",   -- Rounded border for completion menu
      winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,Search:PmenuSel", -- Highlighting
    },
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    format = function(entry, vim_item)
      
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        nvim_lua = "[API]",
        path = "[Path]",
        calc = "[Calc]",
        emoji = "[Emoji]",
      })[entry.source.name] or ""
      return vim_item
    end,
  },

  experimental = {
    ghost_text = true,  -- Show ghost text for suggestions
  },

  completion = {
    autocomplete = {
      require("cmp.types").cmp.TriggerEvent.TextChanged,
    },
    keyword_length = 3,  -- Minimum length to trigger autocompletion
  },

  documentation = {
    border = "single",
    winhighlight = "NormalFloat:Normal,FloatBorder:FloatBorder,Search:Search",
  },
}
