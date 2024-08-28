local M = {}
local map = vim.keymap.set
local d = function(desc)
  return { desc = desc }
end

-- NOTE: NORMAL MODE
map("n", "<A-down>", "<Plug>MoveLineDown", d "Move line down")
map("n", "<A-up>", "<Plug>MoveLineUp", d "Move line up")

-- code nvigation
map("n", "<A-down>", "<Plug>MoveLineDown", d "Move line down")
map("n", "<A-up>", "<Plug>MoveLineUp", d "Move line up")
map("n", "<leader>mj", "<Plug>MoveLineDown", d "Move line down")
map("n", "<leader>mk", "<Plug>MoveLineUp", d "Move line up")
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
map("n", "<leader>wn", "<cmd> NoNeckPain <CR>", d "wrap with NoNeckPain")
map("n", "<leader>ts", "<cmd> TSContextToggle <CR>", d "toggle sticky headers")
-- lsp
map("n", "<leader>ll", "<cmd> LspInfo <CR>", d "lsp info")
map("n", "<leader>ls", "<cmd> LspStop <CR>", d "stop lsp")
map("n", "<leader>lr", "<cmd> LspRestart <CR>", d "restart lsp")
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
map(
  "n",
  "<leader>gbb",
  "<cmd> 0,3G blame <CR>",
  d "view full git blame commit message"
)
map("n", "<leader>gbi", function()
  package.loaded.gitsigns.blame_line()
end, d "view inline git blame commit message")
map("n", "<leader>gd", function()
  vim.lsp.buf.declaration()
end, d "Go to declaration")
map("n", "<leader>tf", "<cmd> NvimTreeFocus <CR>", d "[T]ree [F]ocus")
-- buffers
map(
  "n",
  "<leader>bca",
  "<cmd> %bd|e# <CR>",
  d "Close All buffers except current"
)

-- NOTE: VISUAL MODE
map("v", "<A-down>", "<Plug>MoveBlockDown", d "Move selection down")
map("v", "<A-up>", "<Plug>MoveBlockUp", d "Move selection up")
map("v", "<leader>mj", "<Plug>MoveBlockDown", d "Move selection down")
map("v", "<leader>mk", "<Plug>MoveBlockUp", d "Move selection up")

-- NOTE: INSERT MODE
map("i", "<A-down>", "<C-c> <Plug>MoveLineDown", d "Move selection down")
map("i", "<A-up>", "<C-c> <Plug>MoveLineUp", d "Move selection up")
map("i", "<C-s>", "<C-c> <cmd> w <CR>", d "Save in insert mode")

-- telescope
map("n", "<C-p>", "<cmd> Telescope projects <CR>", d "Projects")
map(
  "n",
  "<leader>fk",
  "<cmd> Telescope keymaps <CR>",
  d "View keymaps via Telescope"
)
map(
  "n",
  "<leader>fc",
  "<cmd> Telescope commands <CR>",
  d "View neovim commands via Telescope"
)
map(
  "n",
  "<leader>fj",
  "<cmd> Telescope jumplist <CR>",
  d "Go to pevious cursor locations"
)
map(
  "n",
  "<leader>fr",
  "<cmd> Telescope registers <CR>",
  d "View paste register"
)
map(
  "n",
  "<leader>fff",
  "<cmd> Telescope builtin previewer=false <CR>",
  d "View telescope builtins"
)

-- OLD MAPPINGS
local M = {}

-- fugitive
map("n", "<leader>gs", "<cmd> Git <CR>")
map("n", "<leader>gf", "<cmd> Git fetch <CR>")
map("n", "<leader>gp", "<cmd> Git pull <CR>")

-- undotree
map("n", "<leader>u", "<cmd> UndotreeToggle <CR>", d "Toggle undotree")

-- nvterm
map("n", "<leader>ht", function()
  require("nvterm.terminal").new "horizontal"
end, d "New horizontal term")

-- dap
map("n", "<leader>q", "<cmd> DapToggleBreakpoint <CR>")

-- dap_python
map("n", "<leader>dpr", function()
  require("dap-python").test_method()
end)

-- lazygit
map("n", "<leader>gg", "<cmd> LazyGit <CR>")

-- M["presence.nvim",
map(
  "n",
  "<leader>dd",
  "<cmd> Lazy load presence.nvim <CR>",
  d "enable discord presence"
)

-- "nvim-tree",
map("n", "<leader>tt", "<cmd> NvimTreeToggle <CR>", d "toggle nvim-tree")

-- M.lsp = {
map(
  "n",
  "<leader>jd",
  "<cmd> lua vim.lsp.buf.definition() <CR>",
  d "jump to definition"
)
map(
  "n",
  "<leader>jD",
  "<cmd> lua vim.lsp.buf.declaration() <CR>",
  d "jump to declaration"
)
map(
  "n",
  "<leader>jr",
  "<cmd> lua vim.lsp.buf.references() <CR>",
  d "jump to references"
)
map(
  "n",
  "<leader>ji",
  "<cmd> lua vim.lsp.buf.implementation() <CR>",
  d "jump to implementation"
)

--  Telescope commands for LSP
map(
  "n",
  "<leader>jff",
  "<cmd> :Telescope builtin default_text=lsp previewer=false <CR>",
  d "lsp biltins"
)
map(
  "n",
  "<leader>jfd",
  "<cmd> :Telescope lsp_definition <CR>",
  d "telescope definition"
)
map(
  "n",
  "<leader>jfD",
  "<cmd> :Telescope lsp_declaration <CR>",
  d "telescope declaration"
)
map(
  "n",
  "<leader>jfr",
  "<cmd> :Telescope lsp_references <CR>",
  d "telescope references"
)
map(
  "n",
  "<leader>jfi",
  "<cmd> :Telescope lsp_implementation <CR>",
  d "telescope implementation"
)

-- M.auto_actions = {
map("n", "<leader>afe", "<cmd> FormatEnable <CR>", d "enable auto formatting")
map("n", "<leader>afd", "<cmd> FormatDisable <CR>", d "disable auto formatting")
map("n", "<leader>as", "<cmd> ASToggle <CR>", d "toggle auto save")

return M
