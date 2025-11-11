return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
            },
          },
        },
      }
    end,
    init = function()
      vim.keymap.set({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject(
          "@function.outer",
          "textobjects"
        )
      end)
      vim.keymap.set({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject(
          "@function.inner",
          "textobjects"
        )
      end)
      vim.keymap.set({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject(
          "@class.outer",
          "textobjects"
        )
      end)
      vim.keymap.set({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject(
          "@class.inner",
          "textobjects"
        )
      end)
      -- You can also use captures from other query groups like `locals.scm`
      vim.keymap.set({ "x", "o" }, "as", function()
        require("nvim-treesitter-textobjects.select").select_textobject(
          "@local.scope",
          "locals"
        )
      end)
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "Wansmer/treesj",
    keys = {
      "<space>m", -- Toggle
      "<space>j", -- Split
      "<space>s", -- Join
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
  },
}
