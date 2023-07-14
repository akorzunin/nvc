vim.api.nvim_exec('language en_US', true)

IS_WINDOWS = vim.loop.os_uname().sysname == "Windows_NT"

function PrintTable( t, indent, done )
	done = done or {}
	indent = indent or 0
	done[t] = true

	for key, value in pairs(t) do
		if type(value) == "table" and not done[value] then
			done[value] = true
			print(string.rep(" ", indent) .. key .. ":")
			PrintTable(value, indent + 2, done)
			done[value] = nil
		else
			print(string.rep(" ", indent) .. key .. " = " .. tostring(value))
		end
	end
end

-- old configs
--require("avkorz")

vim.g.vscode_snippets_path = "C:\\Users\\avkorz\\AppData\\Local\\nvim\\snippets"

-- nvchad configs
require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

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

