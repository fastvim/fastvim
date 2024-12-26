use {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup{
      size = 20,
      open_mapping = [[<C-t>]],
      direction = "horizontal", 
    }
  end
}

