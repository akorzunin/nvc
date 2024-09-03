local M = {
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    name = "rose-pine",
    opts = {
      highlight_groups = {
        Comment = { fg = "subtle" },
      },
      palette = {
        main = {
          text = "#D5D1F6",
        },
      },
    },
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}

return M
