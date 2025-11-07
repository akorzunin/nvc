local plugins = {
  { import = "nvchad.blink.lazyspec" },
  {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    config = function()
      require("supermaven-nvim").setup {}
    end,
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "tailwindcss-language-server",
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "ruff-lsp",
        "pyright",
        "gopls",
      },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      signs = {
        error = "󰚌",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "equalsraf/neovim-gui-shim",
    event = "VeryLazy",
  },
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
  },
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "matze/vim-move",
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nmac427/guess-indent.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "okuuva/auto-save.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { "tpope/vim-surround", event = "VeryLazy", init = function() end },
  { "echasnovski/mini.nvim", version = false },
  {
    "mg979/vim-visual-multi",
  },
}

return plugins
