local cmp = require("cmp")
local luasnip = require("luasnip")
local neokinds = require("neokinds") 

cmp.setup({
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
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
  end, { "i", "s" }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    elseif cmp.visible() then
      cmp.select_prev_item()
    else
      fallback()
    end
  end, { "i", "s" }),
  }),

sources = cmp.config.sources({
  { name = "nvim_lsp" },
  { name = "luasnip" },
  { name = "buffer" },
  { name = "nvim_lua" },
  { name = "path" },
  { name = "calc" },
  { name = "emoji" },
}),

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    format = function(entry, vim_item)
      
      vim_item.kind = string.format("%s %s", neokinds[vim_item.kind] or "", vim_item.kind)
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
    ghost_text = true,
  },

  performance = {
    debounce = 0,
    throttle = 0,
    fetching_timeout = 20000,
    confirm_resolve_timeout = 1,
    async_budget = 1,
    max_view_entries = 100,
  },

  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged },
    keyword_length = 3,
  },
})
