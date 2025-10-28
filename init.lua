DEBUG = false
-- DEBUG = true

require "globals"

if IS_WINDOWS then
  vim.api.nvim_exec2("language en_US", {})
end

vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    repo,
    "--branch=stable",
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- TODO: move to apropriate place later
-- Set breakpon
vim.fn.sign_define(
  "DapBreakpoint",
  { text = "•", texthl = "red", linehl = "", numhl = "" }
)

local CMP = require "cmp"
CMP.mapping["Down"] = CMP.mapping["<Tab>"]
CMP.mapping["Up"] = CMP.mapping["<S-Tab>"]

require "snippets.lua_snippets"

-- load wk groups
require "configs.whichkey_groups"

-- autoformatting is disabled by default
vim.g.disable_autoformat = true
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
-- TODO: make toggle command for formatting and move command to another file
--
-- vim.api.nvim_create_user_command("FormatToggle", function()
--   vim.b.disable_autoformat = not vim.b.disable_autoformat
--   vim.g.disable_autoformat = not vim.b.disable_autoformat
-- end, {
--   desc = "Re-enable autoformat-on-save",
-- })

require("mini.cursorword").setup { delay = 500 }
require("mini.trailspace").setup()
-- INFO: fixes scrolling w/ j/k but breaks scrolling w/ mouse whell
-- require("mini.animate").setup()

vim.api.nvim_create_user_command("DiagnosticToggle", function()
  local config = vim.diagnostic.config
  local vt = config().virtual_text
  config {
    virtual_text = not vt,
    underline = not vt,
    signs = not vt,
  }
end, { desc = "toggle diagnostic" })

vim.filetype.add {
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
}
local enable_providers = {
  "python3_provider",
  -- "node_provider",
  -- and so on
}
for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end
