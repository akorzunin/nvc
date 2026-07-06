local ensure_installed = {
  "bash",
  "c",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "query",
  "regex",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
  "go",
  "nu",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = function(plugin)
      vim.fn.delete(plugin.dir .. "/parser", "rf")
    end,
    lazy = false,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, ensure_installed)
    end,
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup(
          "treesitter_highlight",
          { clear = true }
        ),
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
  {
    "Wansmer/treesj",
    keys = {
      "<space>m", -- Toggle
      "<space>j", -- Split
      "<space>s", -- Join
    },
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    opts = {},
  },
}
