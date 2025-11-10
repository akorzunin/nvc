local plugins = {
  {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    opts = {
      keymaps = {
        accept_suggestion = "<C-k>",
        accept_word = "<C-j>",
        clear_suggestion = "<C-l>",
      },
    },
    keys = {
      { "<leader>st", "<cmd>SupermavenToggle<cr>", desc = "Toggle supermaven" },
    },
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    keys = {
      { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status" },
      { "<leader>gf", "<cmd>Git fetch<cr>", desc = "Git Fetch" },
      { "<leader>gp", "<cmd>Git pull<cr>", desc = "Git Pull" },
    },
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle undotree" },
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
    keys = { { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
  },
  {
    "matze/vim-move",
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>ts",
        "<cmd>TSContextToggle<cr>",
        desc = "toggle sticky headers",
      },
    },
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
    keys = {
      { "<leader>as", "<cmd>ASToggle<CR>", desc = "Toggle auto-save" },
    },
  },
  {
    "nvim-mini/mini.nvim",
    version = false, -- main branch
    init = function()
      require("mini.cursorword").setup { delay = 500 }
      require("mini.trailspace").setup()
      require("mini.ai").setup()
      require("mini.surround").setup {
        mappings = {
          add = "<leader>sa", -- Add surrounding in Normal and Visual modes
          delete = "<leader>sd", -- Delete surrounding
          find = "<leader>sf", -- Find surrounding (to the right)
          find_left = "<leader>sF", -- Find surrounding (to the left)
          highlight = "<leader>sh", -- Highlight surrounding
          replace = "<leader>sr", -- Replace surrounding

          suffix_last = "l", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      }
    end,
  },
  {
    "mg979/vim-visual-multi",
  },
}

return plugins
