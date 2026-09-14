local map = vim.keymap.set
local d = function(desc)
  return { desc = desc }
end

map("i", "<C-V>", "<Nop>", { noremap = true })

vim.api.nvim_create_user_command("KittyHere", function()
  if vim.fn.executable "kitty" == 0 then
    vim.notify("kitty not found", vim.log.levels.ERROR)
    return
  end
  vim.fn.jobstart(
    { "kitty", "--working-directory", vim.fn.getcwd() },
    { detach = true }
  )
end, {})
map("n", "<C-`>", "<cmd>KittyHere<CR>", d "open kitty here")
map("n", "<F1>", function()
  require("cmd.command_palette").open()
end, d "command palette")
map(
  "x",
  "<F1>",
  "<Esc><cmd>lua require('cmd.command_palette').open()<CR>",
  d "command palette"
)
map(
  "i",
  "<F1>",
  "<Esc><cmd>lua require('cmd.command_palette').open()<CR>",
  d "command palette"
)
map("n", "<leader>n", function()
  vim.wo.number = true
  vim.wo.relativenumber = not vim.wo.relativenumber
end, d "toggle relative numbers")
map(
  "n",
  "<Space><Space>",
  "<cmd>%s/\\s\\+$//e<CR>",
  d "trim trailing whitespace"
)

-- comment line
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

map("n", "<leader>wp", '"+gp', d "paste from Windows clipboard")
map("n", "<leader>ww", "<cmd> set wrap! <CR>", d "toggle wrap")
-- Lazy
map("n", "<leader>lz", "<cmd> Lazy <CR>", d "open Lazy plugin manager")
map("n", "<leader>lu", "<cmd> Lazy update <CR>", d "Lazy update plugins")

-- work
map(
  "n",
  "<leader>ee",
  "<cmd> e ++enc=cp1251 <CR>",
  d "change encoding to Windows-1251"
)
map("n", "<leader>eu", "<cmd> e ++enc=utf8 <CR>", d "change encoding to utf8")
map("n", "<leader>sp", "<cmd> set syntax=plsql <CR>", d "set syntax to plsql")
map("n", "<leader>ss", "<cmd> set syntax=sql <CR>", d "set syntax to sql")

-- buffers
map(
  "n",
  "<leader>bca",
  "<cmd> %bd|e# <CR>",
  d "Close All buffers except current"
)

map("i", "<C-s>", "<C-c> <cmd> w <CR>", d "Save in insert mode")

-- Exit nvim
map({ "n", "v" }, "<leader>q", "<cmd> wqa <CR>")
map({ "n", "v" }, "q<leader>", "<cmd> wqa <CR>")

-- vscode-like mappings
map({ "n", "v" }, "<C-z>", "u", d "Undo")
map({ "i" }, "<C-z>", "<Esc>u", d "Undo")
map({ "n" }, "<S-M-Down>", "yyp", { desc = "Copy line", remap = true })
map({ "i" }, "<S-M-Down>", "<Esc>yyp", { desc = "Copy line", remap = true })
map({ "n" }, "<S-M-Up>", "yykp", { desc = "Copy line", remap = true })
map({ "i" }, "<S-M-Up>", "<Esc>yykp", { desc = "Copy line", remap = true })

-- buffers
map("n", "<leader>x", "<cmd> bd<CR>", d "Delete buffer")
map("n", "<leader>bb", "<cmd> bd<CR>", d "Delete buffer")
map("n", "<leader>bn", "<cmd> bn<CR>", d "Next buffer")
map("n", "<M-Right>", "<cmd> bn<CR>", d "Previous buffer")
map("n", "<leader>bp", "<cmd> bp<CR>", d "Previous buffer")
map("n", "<M-Left>", "<cmd> bp<CR>", d "Next buffer")

map(
  { "n", "v" },
  "<F2>",
  "<cmd> lua vim.lsp.buf.code_action()<CR>",
  d "Code action"
)

--set rosepine theme
map("n", "<leader>tp", function()
  require("nvconfig").base46.theme = "rosepine"
  require("base46").load_all_highlights()
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "statusline")
end, d "Rosepine theme")

return {}
