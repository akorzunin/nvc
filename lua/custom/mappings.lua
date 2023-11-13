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
    ["<A-up>"] = { "<Plug>MoveLineUp", "Move line up" },
    ["<A-down>"] = { "<Plug>MoveLineDown", "Move line up" },
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
  },
  v = {
    ["<leader>wc"] = { '"+y', "Copy to Windows clipboard" },
    -- code nvigation
    ["<A-down>"] = { "<Plug>MoveBlockDown", "Move selection down" },
    ["<A-up>"] = { "<Plug>MoveBlockUp", "Move selection up" },
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
return M
