return {
  "xzbdmw/colorful-menu.nvim",
  config = function()
    require("colorful-menu").setup {
      ls = {
        lua_ls = {
          arguments_hl = "@comment",
        },
        gopls = {
          add_colon_before_type = false,
        },
        ["typescript-language-server"] = {
          extra_info_hl = "@comment",
        },
        ["typescript-tools"] = {
          extra_info_hl = "@comment",
        },
        ts_ls = {
          extra_info_hl = "@comment",
        },
        tsserver = {
          extra_info_hl = "@comment",
        },
        vtsls = {
          extra_info_hl = "@comment",
        },
        ["rust-analyzer"] = {
          extra_info_hl = "@comment",
        },
        clangd = {
          extra_info_hl = "@comment",
        },
        roslyn = {
          extra_info_hl = "@comment",
        },
        fallback = true,
      },
      fallback_highlight = "@variable",
      max_width = 60,
    }
  end,
}
