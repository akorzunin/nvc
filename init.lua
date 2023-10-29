require "globals"
if IS_WINDOWS then
    vim.api.nvim_exec("language en_US", true)
end

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

require('snippets.lua_snippets')
