return {
    {
        'nvim-flutter/flutter-tools.nvim',

        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',

            'lukas-reineke/lsp-format.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },

        config = function()
            require("flutter-tools").setup({
                ui = {
                    border = "rounded",
                    notification_style = 'plugin',
                },

                decorations = {
                    statusline = {
                        app_version = true,
                        device = false,
                        project_config = false,
                    },
                },

                debugger = {
                    enabled = false,
                    exception_breakpoints = {},
                    evaluate_to_string_in_debug_views = true,
                    register_configurations = function(paths)
                        -- require("dap").configurations.dart = {
                        -- put here config that you would find in .vscode/launch.json
                        -- }
                        -- If you want to load .vscode launch.json automatically run the following:
                        -- require("dap.ext.vscode").load_launchjs()
                    end,
                },

                flutter_path = nil,
                flutter_lookup_cmd = nil,
                root_patterns = { ".git", "pubspec.yaml" },
                fvm = false,

                widget_guides = {
                    enabled = false,
                },

                closing_tags = {
                    highlight = "ErrorMsg",
                    prefix = ">",
                    priority = 10,
                    enabled = true,
                },

                dev_log = {
                    enabled = true,
                    filter = nil,
                    notify_errors = true,
                    open_cmd = "tabedit",
                },

                dev_tools = {
                    autostart = false,
                    auto_open_browser = false,
                },

                outline = {
                    open_cmd = "30vnew",
                    auto_open = false
                },

                lsp = {
                    color = {
                        enabled = true,
                        background = false,
                        background_color = nil,
                        foreground = false,
                        virtual_text = true,
                        virtual_text_str = "■",
                    },

                    on_attach = require("lsp-format").on_attach,
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),

                    settings = {
                        showTodos = true,
                        completeFunctionCalls = true,
                        analysisExcludedFolders = {},
                        renameFilesWithClasses = "prompt",
                        enableSnippets = true,
                        updateImportsOnRename = true,
                    },
                },
            })
        end,
    },
}
