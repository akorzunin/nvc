local M = {}

M.base46 = {
  theme = "rosepine",
  theme_toggle = { "rosepine", "onedark" },
  tabufline = {},
  statusline = {
    modules = {
      cursor = function()
        local left_sep = "%#St_pos_sep#" .. "" .. "%#St_pos_icon#" .. " "
        local row, col = unpack(vim.fn.getcursorcharpos(), 2, 3)
        local row_v = unpack(vim.fn.getpos "v", 2)
        local mode = vim.api.nvim_get_mode().mode
        local text = row .. ":" .. col
        if mode == "v" then
          local diff = math.abs(row - row_v) + 1
          text = row_v .. "-" .. row .. "(" .. diff .. ")"
        end
        return left_sep .. "%#St_pos_text#" .. " " .. text .. " "
      end,
    },
  },
  changed_themes = {
    rosepine = {
      base_30 = {
        grey_fg = "#908caa",
      },
      base_16 = {},
    },
  },
}

M.mappings = require "nvchad.mappings"

return M
