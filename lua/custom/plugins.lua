local plugins = {{
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
}, {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
        require("core.utils").load_mappings("dap")
    end
}, {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {"mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui"},
    config = function(_, opts)
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
        require("core.utils").load_mappings("dap_python")
    end
}, {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
        return require "custom.configs.null-ls"
    end
}, {
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
}, {"theprimeagen/harpoon"}, {"tpope/vim-fugitive"}, {'rose-pine/neovim'}, {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
        -- This is where you modify the settings for lsp-zero
        -- Note: autocompletion settings will not take effect

        require('lsp-zero.settings').preset({})
    end
}, -- Autocompletion
{
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {{'L3MON4D3/LuaSnip'}},
    config = function()
        -- Here is where you configure the autocompletion settings.
        -- The arguments for .extend() have the same shape as `manage_nvim_cmp`: 
        -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

        require('lsp-zero.cmp').extend()

        -- And you can configure cmp even more, if you want to.
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero.cmp').action()

        cmp.setup({
            mapping = {
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward()
            }
        })
    end
}, -- LSP
{
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
}}
return plugins

