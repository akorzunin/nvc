local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
      -- ["<leader>h"] = "",
      -- ["<C-a>"] = ""
  }
}

M.abc = {
  n = {
    ["<leader>pv"] = {"<cmd> NvimTreeToggle <CR>"}
  }
}

M.fugitive = {
  n = {
    ["<leader>gs"] = {"<cmd> Git <CR>"}
  }
}

return M
