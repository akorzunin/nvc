return {
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "tailwindcss",
        "basedpyright",
        "gopls",
      },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    keys = {
      {
        "<leader>jd",
        "<cmd> lua vim.lsp.buf.definition() <CR>",
        desc = "jump to definition",
      },
      {
        "<leader>gd",
        "<cmd> lua vim.lsp.buf.definition() <CR>",
        desc = "jump to definition",
      },
      {
        "<leader>jD",
        "<cmd> lua vim.lsp.buf.declaration() <CR>",
        desc = "jump to declaration",
      },
      {
        "<leader>jr",
        "<cmd> lua vim.lsp.buf.references() <CR>",
        desc = "jump to references",
      },
      {
        "<leader>ji",
        "<cmd> lua vim.lsp.buf.implementation() <CR>",
        desc = "jump to implementation",
      },
      {
        "<leader>jff",
        "<cmd> :Telescope builtin default_text=lsp previewer=false <CR>",
        desc = "lsp biltins",
      },
      {
        "<leader>jfd",
        "<cmd> :Telescope lsp_definition <CR>",
        desc = "telescope definition",
      },
      {
        "<leader>jfD",
        "<cmd> :Telescope lsp_declaration <CR>",
        desc = "telescope declaration",
      },
      {
        "<leader>jfr",
        "<cmd> :Telescope lsp_references <CR>",
        desc = "telescope references",
      },
      {
        "<leader>jfi",
        "<cmd> :Telescope lsp_implementation <CR>",
        desc = "telescope implementation",
      },
      {
        "<leader>ll",
        "<cmd> LspInfo <CR>",
        desc = "lsp info",
      },
      {
        "<leader>ls",
        "<cmd> LspStop <CR>",
        desc = "stop lsp",
      },
      {
        "<leader>lr",
        "<cmd> LspRestart <CR>",
        desc = "restart lsp",
      },
    },
  },
}
