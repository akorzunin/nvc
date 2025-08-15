local plugins = {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    otps = {},
  },
  {
    "nvim-telescope/telescope-dap.nvim",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function(_, _)
      -- require("core.utils").load_mappings "dap_python"
      local path =
        "C:\\Users\\avkorz\\AppData\\Local\\Programs\\Python\\Python310\\python.exe"
      local dap = require "dap"
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return path
          end,
        },
      }
      require("dap-python").setup(path)
      -- require("core.utils").load_mappings("dap_python")
    end,
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
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
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
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    event = "VeryLazy",
    config = function()
      require("lsp-zero.settings").preset {}
    end,
  },
  {
    "neovim/nvim-lspconfig",
    cmd = "LspInfo",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
      {
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
    },
    config = function()
      -- This is where all the LSP shenanigans will live

      local lsp = require "lsp-zero"

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps {
          buffer = bufnr,
        }
      end)

      -- (Optional) Configure lua language server for neovim
      require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()
    end,
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
    "andweeb/presence.nvim",
    -- event = "VeryLazy",
    opts = {
      main_image = "file",
      neovim_image_text = "Neovim",
      auto_update = true,
      auto_session_enable = false,
    },
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
    "simrat39/symbols-outline.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "nmac427/guess-indent.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
      width = 130, -- matches exactly 121 col in buffer
    },
  },
  {
    "okuuva/auto-save.nvim",
    event = "VeryLazy",
    opts = {
      -- execution_message = {
      --   enabled = false,
      -- },
    },
  },
  { "tpope/vim-surround", event = "VeryLazy", init = function() end },
  { "echasnovski/mini.nvim", version = false },
  -- { "danth/pathfinder.vim", event = "VeryLazy" },
  {
    "mg979/vim-visual-multi",
    -- config = function()
    --   require("vim-visual-multi").setup()
    -- end
  },
}

return plugins
