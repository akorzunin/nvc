local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
      -- ["<leader>h"] = "",
      -- ["<C-a>"] = ""
  }
}

M.general = {
  n = {
    ["<leader>pv"] = {"<cmd> NvimTreeToggle <CR>", "Open file eplorer"},
    ["<leader>wp"] = {'"+gp', "paste from Windows clipboard"}
  },
  v = {
    ["<leader>wc"] = {'"+y', "Copy to Windows clipboard"},
  }
}

M.fugitive = {
  n = {
    ["<leader>gs"] = {"<cmd> Git <CR>"}
  }
}

M.undotree = {
  n = {
    ["<leader>u"] = {"<cmd> UndotreeToggle <CR>", "Toggle undotree"}
  }
}

M.nvterm = {
  plugin = true,
  n = {
    -- new
    ["<leader>ht"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },
  },
}

-- M.nvimtree = {
--   git = {
--     enable = true,
--   },
--   renderer = {
--     highlight_git = true,
--     icons = {
--       show = {
--         git = true,
--       },
--     },
--   },
--   view = {
--     side = "right",
--   },
-- }

return M
