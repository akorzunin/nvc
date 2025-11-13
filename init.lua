DEBUG = false
-- DEBUG = true

require "globals"

if IS_WINDOWS then
  vim.api.nvim_exec2("language en_US", {})
end

vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
require "config.lazy"

require "config.whichkey_groups"
require "mappings"
require "options"

vim.filetype.add { pattern = { [".*/hypr/.*%.conf"] = "hyprlang" } }

-- load theme
require("nvconfig").base46.theme = "rosepine"
require("base46").load_all_highlights()
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "cmd.restore_curr_pos"
require "cmd.startup_magic"
