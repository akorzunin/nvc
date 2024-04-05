local wk = require "which-key"

wk.register {
  -- add group
  ["<leader>"] = {
    g = { name = "git actions" },
    j = { name = "lsp jump" },
    l = { name = "lsp config" },
    f = { name = "telescope actions" },
    s = { name = "set syntax" },
    t = { name = "toggle" },
    a = { name = "auto actions" },
  },
  ["<leader>j"] = {
    f = { name = "lsp telescope" },
  },
  ["<leader>g"] = {
    b = { name = "git blame" },
  },
}
