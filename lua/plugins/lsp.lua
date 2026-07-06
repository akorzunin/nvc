return {
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "ts_ls",
        "tailwindcss",
        "ruff",
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
        "<leader>jt",
        "<cmd> lua vim.lsp.buf.type_definition() <CR>",
        desc = "jump to type definition",
      },
      {
        "K",
        "<cmd> lua vim.lsp.buf.hover() <CR>",
        desc = "show docs/type under cursor",
      },
      {
        "<leader>lh",
        "<cmd> lua vim.lsp.buf.hover() <CR>",
        desc = "show docs/type under cursor",
      },
      {
        "<C-k>",
        "<cmd> lua vim.lsp.buf.signature_help() <CR>",
        desc = "show function signature",
        mode = { "n", "i" },
      },
      {
        "<leader>li",
        function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled { bufnr = 0 },
            { bufnr = 0 }
          )
        end,
        desc = "toggle inlay type hints",
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
        "<cmd> checkhealth vim.lsp <CR>",
        desc = "lsp health",
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
