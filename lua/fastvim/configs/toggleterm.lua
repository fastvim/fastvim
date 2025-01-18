return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = {
      require("toggleterm").setup {
        size = 20,
        open_mapping = [[<C-t>]],
        direction = "horizontal",
      },
    }

    return toggleterm
  end,
}
