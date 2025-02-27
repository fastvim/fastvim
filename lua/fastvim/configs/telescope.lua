return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  opts = {
    defaults = {
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
        },
      },
    },
    pickers = {
      oldfiles = {
        only_cwd = true,
        theme = "dropdown",
      },
    },
  },
}
