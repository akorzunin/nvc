local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = false
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.colorcolumn = "80"

opt.nu = true
opt.relativenumber = true

opt.wrap = true
opt.wrapmargin = 80

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "\\snipppets\\lua_snippets"
local vscode_snippets_path = vim.fn.stdpath "config"
  .. "\\snippets\\vscode_snippets"
vim.g.vscode_snippets_path = vscode_snippets_path
