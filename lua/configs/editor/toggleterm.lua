local toggleterm = {
    require("toggleterm").setup{
      size = 20,
      open_mapping = [[<C-t>]],
      direction = "horizontal", 
    },
}

return toggleterm

