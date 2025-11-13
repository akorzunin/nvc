local map = vim.keymap.set
local d = function(desc)
  return { desc = desc }
end

map("i", "<C-V>", "<Nop>", { noremap = true })

-- comment line
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- debugger
map("n", "<F5>", "<cmd> lua require'dap'.continue() <CR>", d "Start debugger")
map(
  "n",
  "<F9>",
  "<cmd> lua require'dap'.toggle_breakpoint() <CR>",
  d "Toggle breakpoint"
)
map("n", "<F10>", "<cmd> lua require'dap'.step_over() <CR>", d "Start debugger")
map("n", "<F11>", "<cmd> lua require'dap'.step_into() <CR>", d "Start debugger")
map("n", "<F12>", "<cmd> lua require'dap'.step_out() <CR>", d "Start debugger")

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
map({ "n", "v", "i" }, "<C-x>", "dd", d "Delete line")
map({ "n", "v" }, "<C-z>", "u", d "Undo")
map({ "i" }, "<C-z>", "<Esc>u", d "Undo")
map({ "n" }, "<S-M-Down>", "yyp", { desc = "Copy line", remap = true })
map({ "i" }, "<S-M-Down>", "<Esc>yyp", { desc = "Copy line", remap = true })
map({ "n" }, "<S-M-Up>", "yykp", { desc = "Copy line", remap = true })
map({ "i" }, "<S-M-Up>", "<Esc>yykp", { desc = "Copy line", remap = true })

-- buffers
map("n", "<leader>x", "<cmd> bd<CR>", d "Delete buffer")
map("n", "<leader>bb", "<cmd> bd<CR>", d "Delete buffer")
map("n", "<leader>bn", "<cmd> bp<CR>", d "Next buffer")
map("n", "<leader>bp", "<cmd> bn<CR>", d "Previous buffer")
return {}
