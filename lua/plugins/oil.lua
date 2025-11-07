return {
  "stevearc/oil.nvim",
  lazy = false,
  keys = {
    {
      "<leader>o",
      function()
        require("oil").open()
      end,
      desc = "Open oil file browser",
    },
  },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
