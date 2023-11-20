local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "rosepine",
  theme_toggle = { "rosepine", "catppuccin" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    overriden_modules = function(modules)
      modules[10] = (function()
        local left_sep = "%#St_pos_sep#" .. "" .. "%#St_pos_icon#" .. " "
        local current_line = vim.fn.line(".", vim.g.statusline_winid)
        local total_line = vim.fn.line("$", vim.g.statusline_winid)
        local r, c = unpack(vim.api.nvim_win_get_cursor(0))
        local text = r .. ":" .. c + 1
        text = (current_line == 1 and "Top") or text
        text = (current_line == total_line and "Bot") or text
        return left_sep .. "%#St_pos_text#" .. " " .. text .. " "
      end)()
    end,
  },
  tabufline = {
    lazyload = false,
  },
}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

local O = require "plugins.configs.others"
O.blankline.show_current_context_start = false
local T = require "plugins.configs.treesitter"
T.indent = { enable = false }

return M
