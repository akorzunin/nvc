require "nvchad.options"

vim.g.mapleader = " "

vim.opt.list = true
vim.opt.listchars:append { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.listchars:append { eol = "↵" }

vim.opt.number = true
vim.opt.relativenumber = true

vim.wo.wrap = false
