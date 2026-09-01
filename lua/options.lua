require "nvchad.options"

local function escape_langmap(value)
  return vim.fn.escape(value, [[;,."|\]])
end

local en =
  [[~QWERTYUIOP{}|ASDFGHJKL:"ZXCVBNM<>?`qwertyuiop[]asdfghjkl;'zxcvbnm,./]]
local ru =
  [[ЁЙЦУКЕНГШЩЗХЪ/ФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,ёйцукенгшщзхъфывапролджэячсмитьбю.]]
vim.opt.langmap = escape_langmap(ru) .. ";" .. escape_langmap(en)
vim.opt.list = true
vim.opt.listchars:append { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.listchars:append { eol = "↵" }

vim.opt.number = true
vim.opt.relativenumber = true

vim.wo.wrap = false
vim.opt.scrolloff = 5
