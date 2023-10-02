local M = {}

-- In order to disable a default keymap, use
M.disabled = {
    n = {
        -- ["<leader>h"] = "",
        -- ["<C-a>"] = ""
    }
}

M.general = {
    n = {
        -- formatting
        ["<A-F>"]      = { "<cmd> lua vim.lsp.buf.format() <CR>", "Format buffer" },
        -- code nvigation
        ["<A-up>"]     = { "<Plug>MoveLineUp", "Move line up" },
        ["<A-down>"]   = { "<Plug>MoveLineDown", "Move line up" },
        -- debugger
        ["<F5>"]       = { "<cmd> lua require'dap'.continue() <CR>", "Start debugger" },
        ["<F9>"]       = { "<cmd> lua require'dap'.toggle_breakpoint() <CR>", "Toggle breakpoint" },
        ["<F10>"]      = { "<cmd> lua require'dap'.step_over() <CR>", "Start debugger" },
        ["<F11>"]      = { "<cmd> lua require'dap'.step_into() <CR>", "Start debugger" },
        ["<F12>"]      = { "<cmd> lua require'dap'.step_out() <CR>", "Start debugger" },
        ["<leader>wp"] = { '"+gp', "paste from Windows clipboard" },
    },
    v = {
        ["<leader>wc"] = { '"+y', "Copy to Windows clipboard" },
        -- code nvigation
        ["<A-down>"]   = { "<Plug>MoveBlockDown", "Move selection down" },
        ["<A-up>"]     = { "<Plug>MoveBlockUp", "Move selection up" },
    }
}

M.telescope = {
    n = {
        ["<C-p>"] = { "<cmd> Telescope projects <CR>", "Projects" },
        ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "View keymaps via Telescope" },
        ["<leader>fc"] = { "<cmd> Telescope commands <CR>", "View neovim commands via Telescope" },
        ["<leader>fj"] = { "<cmd> Telescope jumplist <CR>", "Go to pevious cursor locations" },
        ["<leader>fr"] = { "<cmd> Telescope registers <CR>", "View paste register" },
    }
}

M.fugitive = {
    n = {
        ["<leader>gs"] = { "<cmd> Git <CR>" },
        ["<leader>gf"] = { "<cmd> Git fetch <CR>" },
        ["<leader>gp"] = { "<cmd> Git push <CR>" },
    }
}

M.undotree = {
    n = {
        ["<leader>u"] = { "<cmd> UndotreeToggle <CR>", "Toggle undotree" }
    }
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
        ["<leader>q"] = { "<cmd> DapToggleBreakpoint <CR>" }
    }
}

M.dap_python = {
    plugin = true,
    n = {
        ["<leader>dpr"] = {
            function()
                require('dap-python').test_method()
            end
        }
    }
}

M.lazygit = {
    n = {
        ["<leader>g"] = { "<cmd> LazyGit <CR>" }
    }
}

return M
