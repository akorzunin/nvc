local M = {}

M.ui = {
  theme = "rosepine",
  theme_toggle = { "rosepine", "onedark" },
  tabufline = {},
  statusline = {
    modules = {
      cursor = function()
        local left_sep = "%#St_pos_sep#" .. "" .. "%#St_pos_icon#" .. " "
        local current_line = vim.fn.line(".", vim.g.statusline_winid)
        local total_line = vim.fn.line("$", vim.g.statusline_winid)
        local r, c = unpack(vim.api.nvim_win_get_cursor(0))
        local text = r .. ":" .. c + 1
        text = (current_line == 1 and "Top") or text
        text = (current_line == total_line and "Bot") or text
        return left_sep .. "%#St_pos_text#" .. " " .. text .. " "
      end,
    },
  },
}

M.mappings = require "nvchad.mappings"

return M
