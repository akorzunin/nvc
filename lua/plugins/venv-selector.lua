return {
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
}
