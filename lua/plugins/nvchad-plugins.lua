return {
  { import = "nvchad.blink.lazyspec" },
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "gitsigns.nvim",
    lazy = false,
    opts = { current_line_blame = true },
    keys = {
      { "<leader>gbb", "<cmd> 0,3G blame <CR>", desc = "full Git blame" },
      {
        "<leader>gbi",
        "<cmd> Gitsigns blame_line <CR>",
        desc = "inline Git blame",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    keys = {
      { "<leader>fk", "<cmd> Telescope keymaps <CR>", desc = "Keymaps" },
      { "<leader>fc", "<cmd> Telescope commands <CR>", desc = "Commands" },
      { "<leader>fj", "<cmd> Telescope jumplist <CR>", desc = "Jumplist" },
      {
        "<leader>fr",
        "<cmd> Telescope registers <CR>",
        desc = "Registers",
      },
      {
        "<leader>fz",
        "<cmd> Telescope current_buffer_fuzzy_find <CR>",
        desc = "Fuzzy find",
      },
      {
        "<leader>fw",
        "<cmd> Telescope live_grep <CR>",
        desc = "Live grep",
      },
      {
        "<leader>ff",
        "<cmd> Telescope find_files <CR>",
        desc = "Find files",
      },
      {
        "<leader>fi",
        "<cmd> Telescope builtin previewer=false <CR>",
        desc = "Builtins",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- This server installed only on :MasonInstallAll
      vim.lsp.enable {
        "lua-language-server",
        "html-lsp",
        "ts_ls",
        "tailwindcss-language-server",
        "debugpy",
        "mypy",
        "ruff",
        "ruff-lsp",
        "based-pyright",
        "gopls",
      }
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      {
        "<leader>tf",
        "<cmd> NvimTreeFocus <CR>",
        desc = "Toggle NvimTree",
        mode = "",
      },
      {
        "<leader>tt",
        "<cmd> NvimTreeToggle <CR>",
        desc = "Toggle NvimTree",
        mode = "",
      },
    },
  },
}
