local plugins = {
    {
        "nvim-tree/nvim-web-devicons",
        event="VeryLazy"
    },
    {
        "tpope/vim-fugitive",
        event="VeryLazy"
    },
    {
        "mbbill/undotree",
        lazy = false
    },
    {
        "theprimeagen/harpoon",
        lazy = false
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("core.utils").load_mappings("dap")
        end
    }, {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {"mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui"},
        -- config = function(_, opts)
            -- local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            -- require("dap-python").setup(path)
            -- require("core.utils").load_mappings("dap_python")
        -- end
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {"black", "debugpy", "mypy", "ruff", "pyright"}
        }
    }, 
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {'nvim-lua/plenary.nvim'},
        -- config = function()
        --     local project_actions = require("telescope._extensions.project.actions")
        --     extensions = {
        --         project = {
        --             base_dirs = {
        --                 '~/dev/src',
        --                 {'~/dev/src2'},
        --                 {'~/dev/src3', max_depth = 4},
        --                 {path = '~/dev/src4'},
        --                 {path = '~/dev/src5', max_depth = 2},
        --             },
        --             hidden_files = true, -- default: false
        --             theme = "dropdown",
        --             order_by = "asc",
        --             search_by = "title",
        --             sync_with_nvim_tree = true, -- default false
        --             -- default for on_project_selected = find project files
        --             on_project_selected = function(prompt_bufnr)
        --                 -- Do anything you want in here. For example:
        --                 project_actions.change_working_directory(prompt_bufnr, false)
        --                 require("harpoon.ui").nav_file(1)
        --             end
        --         }
        --     }
        -- end,
    },
    {
        "folke/trouble.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            signs = {
                -- icons / text used for a diagnostic
                error = "󰚌",
                warning = "",
                hint = "",
                information = "",
                other = "",
            },
        }
    },
    {
        'rose-pine/neovim'
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        config = function()
            -- This is where you modify the settings for lsp-zero
            -- Note: autocompletion settings will not take effect

            require('lsp-zero.settings').preset({})
        end
    },
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {{'hrsh7th/cmp-nvim-lsp'}, {'williamboman/mason-lspconfig.nvim'}, {
            'williamboman/mason.nvim',
            ensure_installed = {
                "black",
                "ruff",
                "mypy",
                "pyright",
            },
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
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = {"python"},
        opts = function()
            return require "custom.configs.null-ls"
        end
    },
    -- TODO: some stuff
    -- NOTE: some note
    -- {
    --     "ahmedkhalf/project.nvim",
    --     lazy = false,
    --     config = function()
    --         require("project_nvim").setup {
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --         }
    --     end
    -- },
    -- TODO: and moe stuff
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function ()
            local tdc = require "todo-comments"
            tdc.opts = {}
            tdc.setup()
        end
    },
}
return plugins
