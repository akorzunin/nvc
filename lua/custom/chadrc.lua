---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "rosepine",
  theme_toggle = { "rosepine", "onedark" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

return M
