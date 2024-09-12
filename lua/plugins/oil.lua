return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
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
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
