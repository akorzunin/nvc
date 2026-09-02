require "nvchad.options"

local function escape_langmap(value)
  return vim.fn.escape(value, [[;,."|\]])
end

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift =
  [[ЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
vim.opt.langmap = table.concat({
  escape_langmap(ru_shift) .. ";" .. escape_langmap(en_shift),
  escape_langmap(ru) .. ";" .. escape_langmap(en),
}, ",")
vim.opt.list = true
vim.opt.listchars:append { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.listchars:append { eol = "↵" }

vim.opt.number = true
vim.opt.relativenumber = true

vim.wo.wrap = false
vim.opt.scrolloff = 5
