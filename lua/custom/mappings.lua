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
    ["<leader>pv"] = {"<cmd> NvimTreeToggle <CR>"}
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
--
-- local mark = require("harpoon.mark")
-- M.harpoon = {
--   ["<leader>ha"] = {
--     function()
--       mark.add_file
--     end,
--     "Harpoon: add files",
--   },
--   ["<leader>he"] = {
--     function()
--       local ui = require("harpoon.ui")
--       ui.toggle_quick_menu
--     end,
--     "Harpoon: show files",
--
--   }
-- }
  -- ["<leader>ht"] = {
    --   function()
    --     require("nvterm.terminal").new "horizontal"
    --   end,
    --   "New horizontal term",
    -- },

return M
