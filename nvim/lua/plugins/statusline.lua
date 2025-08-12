return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16, -- ~60fps
                    events = {
                        'WinEnter',
                        'BufEnter',
                        'BufWritePost',
                        'SessionLoadPost',
                        'FileChangedShellPost',
                        'VimResized',
                        'Filetype',
                        'CursorMoved',
                        'CursorMovedI',
                        'ModeChanged',
                    },
                }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    'branch',
                    'diff',
                    {
                        'lsp_status',
                        icon = "",
                        symbols = {
                            spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                            done = '✓',
                            separator = ' ',
                        },
                    },
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp', 'nvim_diagnostic', },
                        sections = { 'error', 'warn', 'info', 'hint', },
                        symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H',},
                        colored = false,
                        update_in_insert = false,
                        always_visible = true,
                    },
                },
                lualine_c = { 'filename' },
                lualine_x = {
                    'encoding',
                    'fileformat',
                    'filetype',
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {
                    'branch',
                    'diff',
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp', 'nvim_diagnostic', },
                        sections = { 'error', 'warn', 'info', 'hint', },
                        diagnostics_color = {
                            error = 'DiagnosticError',
                            warn  = 'DiagnosticWarn',
                            info  = 'DiagnosticInfo',
                            hint  = 'DiagnosticHint',
                        },
                        symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H', },
                        colored = true,
                        update_in_insert = false,
                        always_visible = false,
                    },
                },
                lualine_c = { 'filename' },
                lualine_x = {
                    'encoding',
                    'fileformat',
                    'filetype',
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    },
}
