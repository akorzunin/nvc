return {
  "stevearc/oil.nvim",
  commit = "548587d68b55e632d8a69c92cefd981f360634fa",
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
