DEBUG = false
-- DEBUG = true
require "globals"
if IS_WINDOWS then
  vim.api.nvim_exec("language en_US", true)
end
-- local default_config = require "core.default_config"
-- default_config.lazy_nvim.change_detection = { enabled = false }

vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
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
require("dap-go").setup {}

local CMP = require "cmp"
CMP.mapping["Down"] = CMP.mapping["<Tab>"]
CMP.mapping["Up"] = CMP.mapping["<S-Tab>"]

require "snippets.lua_snippets"

-- load wk groups
require "configs.whichkey_groups"

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

vim.opt.list = true
vim.opt.listchars:append({ tab = '» ', trail = '·', nbsp = '␣' })
vim.opt.listchars:append({ eol = '↵' })
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
