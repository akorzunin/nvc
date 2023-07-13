---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
    theme = "rosepine",
    theme_toggle = { "rosepine", "catppuccin",  },

    hl_override = highlights.override,
    hl_add = highlights.add,
    statusline = {
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow (separators work only for "default" statusline theme;
        -- round and block will work for the minimal theme only)
        separator_style = "block",
        overriden_modules = nil,
    },
}

M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

return M
