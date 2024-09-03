local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
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
  --
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
    "akorzunin/project.nvim",
    dir = (function()
      if DEBUG and IS_WINDOWS then
        return "C:\\Users\\akorz\\Documents\\project.nvim"
      elseif DEBUG and not IS_WINDOWS then
        return "~/Documents/project.nvim"
      end
      return nil
    end)(),
    event = "VeryLazy",
    config = function()
      require("project_nvim").setup {
        show_files = "filtered_builtin",
        list = {
          "oldfiles",
          "find_files",
          "live_grep",
        },
      }
      require("nvim-tree").setup {
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        git = {
          ignore = false,
        },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    config = function()
      local tdc = require "todo-comments"
      tdc.opts = {}
      tdc.setup()
    end,
  },
  {
    "equalsraf/neovim-gui-shim",
    event = "VeryLazy",
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      -- for DAP support
      "mfussenegger/nvim-dap-python",
    },
    config = true,
    branch = "regexp",
    keys = {
      {
        "<leader>vs",
        "<cmd>:VenvSelect<cr>",
        -- optional if you use a autocmd (see #🤖-Automate)
        "<leader>vc",
        "<cmd>:VenvSelectCached<cr>",
      },
    },
    opts = {
      auto_refresh = false,
      search_venv_managers = true,
      search_workspace = true,
      search = true,
      dap_enabled = false,
      parents = 2,
      name = "venv", -- NOTE: You can also use a lua table here for multiple names: {"venv", ".venv"}`
      fd_binary_name = "fd",
      notify_user_on_activate = true,
    },
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
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
      -- "NvChad/nvterm",
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
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>af",
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    -- Everything in opts will be passed to setup()
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        go = { "golines" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
      },
      -- Set up format-on-save
      format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { "sql", "java" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match "/node_modules/" then
          return
        end
        return { timeout_ms = 1500, lsp_fallback = true }
      end,
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    "okuuva/auto-save.nvim",
    event = "VeryLazy",
    opts = {
      execution_message = {
        enabled = false,
      },
    },
  },
  { "tpope/vim-surround", event = "VeryLazy", init = function() end },
  { "echasnovski/mini.nvim", version = false },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      messages = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
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
  },
  {
    "akorzunin/semshi",
    build = ":UpdateRemotePlugins",
    version = "*", -- Recommended to use the latest release
    -- event = "VeryLazy",
    init = function() -- example, skip if you're OK with the default config
      vim.g["semshi#error_sign"] = false
    end,
    config = function()
      -- any config or setup that would need to be done after plugin loading
    end,
  },
}
table.insert(plugins, require "plugins.themes")
return plugins
