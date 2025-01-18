return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  opts = {
    themable = true,
    offsets = {
      { filetype = "NvimTree", highlight = "NvimTreeNormal" },
    },
  },
}
