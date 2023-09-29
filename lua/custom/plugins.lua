local plugins = {
    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy"
    },
    {
        "tpope/vim-fugitive",
        event = "VeryLazy"
    },
    {
        "mbbill/undotree",
        event = "VeryLazy"
    },
    -- DEBUGGER
    {
        "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("core.utils").load_mappings("dap")
        end
    },
    {
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
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        otps = {
            enabled = true,                     -- enable this plugin (the default)
            enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
            highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
            highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
            show_stop_reason = true,            -- show stop reason when stopped for exceptions
            commented = false,                  -- prefix virtual text with comment string
            only_first_definition = true,       -- only show virtual text at first definition (if there are multiple)
            all_references = false,             -- show virtual text on all all references of the variable (not only definitions)
            clear_on_continue = false,          -- clear virtual text on "continue" (might cause flickering when stepping)
            --- A callback that determines how a variable is displayed or whether it should be omitted
            --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
            --- @param buf number
            --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
            --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
            --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
            --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
            display_callback = function(variable, buf, stackframe, node, options)
                if options.virt_text_pos == 'inline' then
                    return ' = ' .. variable.value
                else
                    return variable.name .. ' = ' .. variable.value
                end
            end,
            -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
            virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

            -- experimental features:
            all_frames = false,     -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
            virt_lines = false,     -- show virtual lines instead of virtual text (will flicker!)
            virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
            -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
        }
    },
    {
        "nvim-telescope/telescope-dap.nvim",
    },
    {
        "leoluz/nvim-dap-go",
        ft = "go"
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
        config = function(_, opts)
            require("core.utils").load_mappings("dap_python")
            local path = 'C:\\Users\\avkorz\\AppData\\Local\\Programs\\Python\\Python310\\python.exe'
            local dap = require('dap')
            dap.configurations.python = {
                {
                    type = 'python',
                    request = 'launch',
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function()
                        return path
                    end,
                },
            }
            require("dap-python").setup(path)
            -- require("core.utils").load_mappings("dap_python")
        end
    },
    --
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "html-lsp",
                "tailwindcss-language-server",
                "black",
                "debugpy",
                "mypy",
                "ruff",
                "ruff-lsp",
                "pyright",
                "gopls"
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    },
    -- {
    --     'nvim-telescope/telescope.nvim',
    --     -- tag = '0.1.1',
    --     dependencies = { 'nvim-lua/plenary.nvim' },
    --     config = function()
    --         require('telescope').load_extension('dap')
    --         --     local project_actions = require("telescope._extensions.project.actions")
    --         --     extensions = {
    --         --         project = {
    --         --             base_dirs = {
    --         --                 '~/dev/src',
    --         --                 {'~/dev/src2'},
    --         --                 {'~/dev/src3', max_depth = 4},
    --         --                 {path = '~/dev/src4'},
    --         --                 {path = '~/dev/src5', max_depth = 2},
    --         --             },
    --         --             hidden_files = true, -- default: false
    --         --             theme = "dropdown",
    --         --             order_by = "asc",
    --         --             search_by = "title",
    --         --             sync_with_nvim_tree = true, -- default false
    --         --             -- default for on_project_selected = find project files
    --         --             on_project_selected = function(prompt_bufnr)
    --         --                 -- Do anything you want in here. For example:
    --         --                 project_actions.change_working_directory(prompt_bufnr, false)
    --         --                 require("harpoon.ui").nav_file(1)
    --         --             end
    --         --         }
    --         --     }
    --     end,
    -- },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
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
        event = "VeryLazy",
        config = function()
            -- This is where you modify the settings for lsp-zero
            -- Note: autocompletion settings will not take effect

            require('lsp-zero.settings').preset({})
        end
    },
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = { { 'hrsh7th/cmp-nvim-lsp' }, { 'williamboman/mason-lspconfig.nvim' }, {
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end
        } },
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
    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     ft = { "python" },
    --     opts = function()
    --         return require "custom.configs.null-ls"
    --     end
    -- },
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
        "ahmedkhalf/project.nvim",
        event = "VeryLazy",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
            require("nvim-tree").setup({
                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = true
                },
            })
        end
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function()
            local tdc = require "todo-comments"
            tdc.opts = {}
            tdc.setup()
        end
    },
    {
        "equalsraf/neovim-gui-shim",
        event = "VeryLazy",
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-telescope/telescope.nvim",
            -- for DAP support
            "mfussenegger/nvim-dap-python"
        },
        config = true,
        keys = { {
            "<leader>vs", "<cmd>:VenvSelect<cr>",
            -- optional if you use a autocmd (see #🤖-Automate)
            "<leader>vc", "<cmd>:VenvSelectCached<cr>"
        } },
        opts = {

            -- auto_refresh (default: false). Will automatically start a new search every time VenvSelect is opened.
            -- When its set to false, you can refresh the search manually by pressing ctrl-r. For most users this
            -- is probably the best default setting since it takes time to search and you usually work within the same
            -- directory structure all the time.
            auto_refresh = false,

            -- search_venv_managers (default: true). Will search for Poetry/Pipenv/Anaconda virtual environments in their
            -- default location. If you dont use the default location, you can
            search_venv_managers = true,

            -- search_workspace (default: true). Your lsp has the concept of "workspaces" (project folders), and
            -- with this setting, the plugin will look in those folders for venvs. If you only use venvs located in
            -- project folders, you can set search = false and search_workspace = true.
            search_workspace = true,

            -- path (optional, default not set). Absolute path on the file system where the plugin will look for venvs.
            -- Only set this if your venvs are far away from the code you are working on for some reason. Otherwise its
            -- probably better to let the VenvSelect search for venvs in parent folders (relative to your code). VenvSelect
            -- searchs for your venvs in parent folders relative to what file is open in the current buffer, so you get
            -- different results when searching depending on what file you are looking at.
            -- path = "/home/username/your_venvs",

            -- search (default: true). Search your computer for virtual environments outside of Poetry and Pipenv.
            -- Used in combination with parents setting to decide how it searches.
            -- You can set this to false to speed up the plugin if your virtual envs are in your workspace, or in Poetry
            -- or Pipenv locations. No need to search if you know where they will be.
            search = true,

            -- dap_enabled (default: false). When true, uses the selected virtual environment with the debugger.
            -- require nvim-dap-python from https://github.com/mfussenegger/nvim-dap-python
            -- require debugpy from https://github.com/microsoft/debugpy
            -- require nvim-dap from https://github.com/mfussenegger/nvim-dap
            dap_enabled = false,

            -- parents (default: 2) - Used when search = true only. How many parent directories the plugin will go up
            -- (relative to where your open file is on the file system when you run VenvSelect). Once the parent directory
            -- is found, the plugin will traverse down into all children directories to look for venvs. The higher
            -- you set this number, the slower the plugin will usually be since there is more to search.
            -- You may want to set this to to 0 if you specify a path in the path setting to avoid searching parent
            -- directories.
            parents = 2,

            -- name (default: venv) - The name of the venv directories to look for.
            name = "venv", -- NOTE: You can also use a lua table here for multiple names: {"venv", ".venv"}`

            -- fd_binary_name (default: fd) - The name of the fd binary on your system.
            fd_binary_name = "fd",


            -- notify_user_on_activate (default: true) - Prints a message that the venv has been activated
            notify_user_on_activate = true,

        },
        event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    },
    {
        "folke/neodev.nvim",
        event = "VeryLazy",
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
        },
        config = true
    },
    {
        "andweeb/presence.nvim",
        event = "VeryLazy",
        opts = {
            neovim_image_text = "aboba",
        }
    }
}
return plugins
