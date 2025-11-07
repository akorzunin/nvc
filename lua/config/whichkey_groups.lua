local wk = require "which-key"

wk.add {
  { "<leader>a", group = "auto actions" },
  { "<leader>f", group = "telescope actions" },
  { "<leader>g", group = "git actions" },
  { "<leader>gb", group = "git blame" },
  { "<leader>j", group = "lsp jump" },
  { "<leader>jf", group = "lsp telescope" },
  { "<leader>l", group = "lsp config" },
  { "<leader>s", group = "set syntax" },
  { "<leader>t", group = "toggle" },
}
