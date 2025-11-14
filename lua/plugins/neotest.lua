M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  opts = {
    adapters = {
      ["neotest-python"] = {
        runner = "pytest",
        python = ".venv/bin/python",
        args = { "--capture=no", "-v" }, -- Verbose output
        pytest_discover_instances = true,
      },
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function()
        if require("lazyvim.util").has "trouble.nvim" then
          require("trouble").open { mode = "quickfix", focus = false }
        else
          vim.cmd "copen"
        end
      end,
    },
  },
  -- Optional: Add keybindings
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      desc = "Run File",
    },
    {
      "<leader>tT",
      function()
        require("neotest").run.run(vim.uv.cwd())
      end,
      desc = "Run All Test Files",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open { enter = true, auto_close = true }
      end,
      desc = "Show Output",
    },
  },
}
return {}
