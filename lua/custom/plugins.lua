local plugins = {
    {"nvim-tree/nvim-web-devicons", lazy = false},
    {"tpope/vim-fugitive", lazy=false},
    {"mbbill/undotree", lazy = false},
    {"theprimeagen/harpoon", lazy = false},
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {"black", "debugpy", "mypy", "ruff", "pyright"}
        }
    }, {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    }, {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {'nvim-lua/plenary.nvim'}
    }, {
        "folke/trouble.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }, {"theprimeagen/harpoon"}, {"tpope/vim-fugitive", lazy=false}, {'rose-pine/neovim'}, {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        config = function()
            -- This is where you modify the settings for lsp-zero
            -- Note: autocompletion settings will not take effect

            require('lsp-zero.settings').preset({})
        end
    },  {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {{'hrsh7th/cmp-nvim-lsp'}, {'williamboman/mason-lspconfig.nvim'}, {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end
        }},
        config = function()
            -- This is where all the LSP shenanigans will live

            local lsp = require('lsp-zero')

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({
                    buffer = bufnr
                })
            end)

            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()
        end
    },
}
return plugins

