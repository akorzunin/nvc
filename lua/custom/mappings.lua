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
        ["<leader>pv"] = { "<cmd> NvimTreeToggle <CR>", "Open file eplorer" },
        ["<leader>wp"] = { '"+gp', "paste from Windows clipboard" },
        ["<A-j>"] = { "<cmd> move +1 <CR>", "Move line down" },
        ["<A-k>"] = { "<cmd> move -2 <CR>", "Move line up" },
        ["<C-p>"] = { "<cmd> Telescope projects <CR>", "Projects" },
        ["<A-F>"] = { "<cmd> lua vim.lsp.buf.format() <CR>", "Format buffer" },
        ["<F5>"] = { "<cmd> lua require'dap'.continue() <CR>", "Start debugger" },
        ["<F9>"] = { "<cmd> lua require'dap'.toggle_breakpoint() <CR>", "Toggle breakpoint" },
        ["<F10>"] = { "<cmd> lua require'dap'.step_over() <CR>", "Start debugger" },
        ["<F11>"] = { "<cmd> lua require'dap'.step_into() <CR>", "Start debugger" },
        ["<F12>"] = { "<cmd> lua require'dap'.step_out() <CR>", "Start debugger" },
    },
    v = {
        ["<leader>wc"] = { '"+y', "Copy to Windows clipboard" },
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
        ["<leader>g"] = { "<cmd> LazyGit <CR>"}
    }
}

return M
