DEBUG = false
-- DEBUG = true
require "globals"
if IS_WINDOWS then
  vim.api.nvim_exec("language en_US", true)
end
local default_config = require "core.default_config"
default_config.lazy_nvim.change_detection = { enabled = false }
-- nvchad configs
require "core"
local custom_init_path =
  vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

-- TODO: move to apropriate place later
-- Set breakpon
vim.fn.sign_define(
  "DapBreakpoint",
  { text = "•", texthl = "red", linehl = "", numhl = "" }
)
require("dap-go").setup {}

local CMP = require "cmp"
CMP.mapping["Down"] = CMP.mapping["<Tab>"]
CMP.mapping["Up"] = CMP.mapping["<S-Tab>"]

require "snippets.lua_snippets"

-- load wk groups
require "custom.whichkey_groups"

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.api.nvim_exec("arg", true)
    if arg == nil or arg == "" then
      vim.defer_fn(function()
        -- temporary solution, need to explisitly wait for Lazy -> Telescope -> project.nvim
        -- to load
        vim.cmd "Telescope projects"
      end, 50)
    end
  end,
})

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
-- vim.api.nvim_create_user_command("FormatToggle", function()
--   vim.b.disable_autoformat = not vim.b.disable_autoformat
--   vim.g.disable_autoformat = not vim.b.disable_autoformat
-- end, {
--   desc = "Re-enable autoformat-on-save",
-- })

require("mini.cursorword").setup { delay = 500 }
-- INFO: fixes scrolling w/ j/k but breaks scrolling w/ mouse whell
-- require("mini.animate").setup()
