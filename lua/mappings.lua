local map = vim.keymap.set
local d = function(desc)
  return { desc = desc }
end

-- n
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

-- v

-- i

-- OLD MAPPINGS
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    -- ["<leader>h"] = "",
    -- ["<C-a>"] = ""
  },
}

M.general = {
  n = {
    -- formatting
    ["<A-F>"] = { "<cmd> lua vim.lsp.buf.format() <CR>", "Format buffer" },
    -- code nvigation
    ["<A-down>"] = { "<Plug>MoveLineDown", "Move line down" },
    ["<A-up>"] = { "<Plug>MoveLineUp", "Move line up" },
    ["<leader>mj"] = { "<Plug>MoveLineDown", "Move line down" },
    ["<leader>mk"] = { "<Plug>MoveLineUp", "Move line up" },
    -- debugger
    ["<F5>"] = { "<cmd> lua require'dap'.continue() <CR>", "Start debugger" },
    ["<F9>"] = {
      "<cmd> lua require'dap'.toggle_breakpoint() <CR>",
      "Toggle breakpoint",
    },
    ["<F10>"] = { "<cmd> lua require'dap'.step_over() <CR>", "Start debugger" },
    ["<F11>"] = { "<cmd> lua require'dap'.step_into() <CR>", "Start debugger" },
    ["<F12>"] = { "<cmd> lua require'dap'.step_out() <CR>", "Start debugger" },
    ["<leader>wp"] = { '"+gp', "paste from Windows clipboard" },
    ["<leader>ww"] = { "<cmd> set wrap! <CR>", "toggle wrap" },
    ["<leader>wn"] = { "<cmd> NoNeckPain <CR>", "wrap with NoNeckPain" },
    ["<leader>ts"] = { "<cmd> TSContextToggle <CR>", "toggle sticky headers" },
    -- lsp
    ["<leader>ll"] = { "<cmd> LspInfo <CR>", "lsp info" },
    ["<leader>ls"] = { "<cmd> LspStop <CR>", "stop lsp" },
    ["<leader>lr"] = { "<cmd> LspRestart <CR>", "restart lsp" },
    -- Lazy
    ["<leader>lz"] = { "<cmd> Lazy <CR>", "open Lazy plugin manager" },
    ["<leader>lu"] = { "<cmd> Lazy update <CR>", "Lazy update plugins" },
    -- work
    ["<leader>ee"] = {
      "<cmd> e ++enc=cp1251 <CR>",
      "change encoding to Windows-1251",
    },
    ["<leader>eu"] = { "<cmd> e ++enc=utf8 <CR>", "change encoding to utf8" },
    ["<leader>sp"] = { "<cmd> set syntax=plsql <CR>", "set syntax to plsql" },
    ["<leader>ss"] = { "<cmd> set syntax=sql <CR>", "set syntax to sql" },
    ["<leader>gbb"] = {
      "<cmd> 0,3G blame <CR>",
      "view full git blame commit message",
    },
    ["<leader>gbi"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "view inline git blame commit message",
    },
    ["<leader>gd"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "Go to declaration",
    },
    ["<leader>tf"] = { "<cmd> NvimTreeFocus <CR>", "[T]ree [F]ocus" },
    -- buffers
    ["<leader>bca"] = {
      "<cmd> %bd|e# <CR>",
      "CLose All buffers except current",
    },
  },
  v = {
    ["<leader>wc"] = { '"+y', "Copy to Windows clipboard" },
    -- code nvigation
    ["<A-down>"] = { "<Plug>MoveBlockDown", "Move selection down" },
    ["<A-up>"] = { "<Plug>MoveBlockUp", "Move selection up" },
    ["<leader>mj"] = { "<Plug>MoveBlockDown", "Move selection down" },
    ["<leader>mk"] = { "<Plug>MoveBlockUp", "Move selection up" },
  },
  i = {
    ["<A-down>"] = { "<C-c> <Plug>MoveLineDown", "Move selection down" },
    ["<A-up>"] = { "<C-c> <Plug>MoveLineUp", "Move selection up" },
    ["<C-s>"] = { "<C-c> <cmd> w <CR>", "Save in insert mode" },
  },
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope projects <CR>", "Projects" },
    ["<leader>fk"] = {
      "<cmd> Telescope keymaps <CR>",
      "View keymaps via Telescope",
    },
    ["<leader>fc"] = {
      "<cmd> Telescope commands <CR>",
      "View neovim commands via Telescope",
    },
    ["<leader>fj"] = {
      "<cmd> Telescope jumplist <CR>",
      "Go to pevious cursor locations",
    },
    ["<leader>fr"] = { "<cmd> Telescope registers <CR>", "View paste register" },
    ["<leader>fff"] = {
      "<cmd> Telescope builtin previewer=false <CR>",
      "View telescope builtins",
    },
  },
}

M.fugitive = {
  n = {
    ["<leader>gs"] = { "<cmd> Git <CR>" },
    ["<leader>gf"] = { "<cmd> Git fetch <CR>" },
    ["<leader>gp"] = { "<cmd> Git pull <CR>" },
  },
}

M.undotree = {
  n = {
    ["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "Toggle undotree" },
  },
}

M.nvterm = {
  plugin = true,
  n = {
    -- new
    ["<leader>ht"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "New horizontal term",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>q"] = { "<cmd> DapToggleBreakpoint <CR>" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<cmd> LazyGit <CR>" },
  },
}

M["presence.nvim"] = {
  n = {
    ["<leader>dd"] = {
      "<cmd> Lazy load presence.nvim <CR>",
      "enable discord presence",
    },
  },
}

M["nvim-tree"] = {
  n = {
    ["<leader>tt"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvim-tree" },
  },
}

M.lsp = {
  n = {
    ["<leader>jd"] = {
      "<cmd> lua vim.lsp.buf.definition() <CR>",
      "jump to definition",
    },
    ["<leader>jD"] = {
      "<cmd> lua vim.lsp.buf.declaration() <CR>",
      "jump to declaration",
    },
    ["<leader>jr"] = {
      "<cmd> lua vim.lsp.buf.references() <CR>",
      "jump to references",
    },
    ["<leader>ji"] = {
      "<cmd> lua vim.lsp.buf.implementation() <CR>",
      "jump to implementation",
    },
    --  Telescope commands for LSP
    ["<leader>jff"] = {
      "<cmd> :Telescope builtin default_text=lsp previewer=false <CR>",
      "lsp biltins",
    },
    ["<leader>jfd"] = {
      "<cmd> :Telescope lsp_definition <CR>",
      "telescope definition",
    },
    ["<leader>jfD"] = {
      "<cmd> :Telescope lsp_declaration <CR>",
      "telescope declaration",
    },
    ["<leader>jfr"] = {
      "<cmd> :Telescope lsp_references <CR>",
      "telescope references",
    },
    ["<leader>jfi"] = {
      "<cmd> :Telescope lsp_implementation <CR>",
      "telescope implementation",
    },
  },
}

M.auto_actions = {
  n = {
    -- <leader>af defined in other place
    ["<leader>afe"] = { "<cmd> FormatEnable <CR>", "enable auto formatting" },
    ["<leader>afd"] = { "<cmd> FormatDisable <CR>", "disable auto formatting" },
    ["<leader>as"] = { "<cmd> ASToggle <CR>", "toggle auto save" },
  },
}
return M
