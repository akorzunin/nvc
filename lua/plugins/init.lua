local map = vim.keymap.set
local d = function(desc)
  return { desc = desc }
end
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
      {
        "<C-j>",
        "<cmd>SupermavenAcceptWord<cr>",
        desc = "Accept word",
        noremap = true,
      },
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
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
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
    keys = {
      { "<leader>vm", "<cmd>m+1<cr>", desc = "Move line down" },
      { "<leader>vM", "<cmd>m-2<cr>", desc = "Move line up" },
    },
    init = function()
      -- line
      map("n", "<A-down>", "<Plug>MoveLineDown", d "Move line down")
      map("n", "<A-up>", "<Plug>MoveLineUp", d "Move line up")
      map("n", "<C-A-j>", "<Plug>MoveLineDown", d "Move line down")
      map("n", "<C-A-k>", "<Plug>MoveLineUp", d "Move line up")

      -- block
      map("v", "<A-down>", "<Plug>MoveBlockDown", d "Move selection down")
      map("v", "<A-up>", "<Plug>MoveBlockUp", d "Move selection up")
      map("v", "<C-A-j>", "<Plug>MoveBlockDown", d "Move selection down")
      map("v", "<C-A-k>", "<Plug>MoveBlockUp", d "Move selection up")
    end,
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
    event = "VeryLazy",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Find Subword Underv"] = "<C-n>",
        ["Add Cursor Down"] = "<C-Down>",
        ["Add Cursor Up"] = "<C-Up>",
        ["Add Cursor At Pos"] = "<C-.>",
      }
      vim.g.VM_show_warnings = 0
      vim.g.VM_mouse_mappings = 1
      vim.g.VM_auto_select = 1
      vim.g.VM_auto_selection = 1
      vim.g.VM_max_count = 10
      vim.g.VM_max_jumps = 10
      vim.g.VM_excluded_filetypes = { "TelescopePrompt", "vimwiki" }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    init = function()
      local args = vim.fn.argv()
      if #args ~= 1 then
        return
      end
      if args[1] ~= ":/" then
        return
      end
      vim.g.session_loaded = true
      require("persistence").load()
      -- some fucked up magick
      pcall(vim.cmd.bdelete, { bang = true, args = { "NvimTree_1" } })
      pcall(vim.cmd.bdelete, { bang = true, args = { ":f" } })
      pcall(vim.cmd.bdelete, { bang = true, args = { ":w" } })
      pcall(vim.cmd.bdelete, { bang = true, args = { ":" } })
      -- nvim-tree-api.tree.toggle_no_buffer_filter()
      vim.cmd.NvimTreeToggle()
      vim.cmd.NvimTreeToggle()
    end,
    keys = {
      {
        "<leader>sl",
        "<cmd>lua require('persistence').load()<cr>",
        desc = "Load session",
      },
      {
        "<leader>sc",
        "<cmd>lua require('persistence').select()<cr>",
        desc = "Select session",
      },
    },
  },
  {
    "ChuufMaster/buffer-vacuum",
    opts = {
      max_buffers = 3,
    },
  },
}

return plugins
