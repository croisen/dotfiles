-- A misleading name for this file but it's true that it's trees
return {
    -- Thanks Sublime and VS Code to making me used to file trees on the left...
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            vim.g.nvim_tree_auto_open = 1
            require("nvim-tree").setup({
                sort_by = "case_sensitive",

                view = {
                    width = 25,
                },

                renderer = {
                    group_empty = true,
                },

                filters = {
                    dotfiles = false,
                },

            })
        end,
    },
    'nvim-tree/nvim-web-devicons',

    -- Treesitter
    'HiPhish/nvim-ts-rainbow2',
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'HiPhish/nvim-ts-rainbow2',
        },

        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_maintained = "all",
                sync_install = false,
                auto_install = true,
                ignore_install = { "markdown" },

                highlight = {
                    enable = true,
                    disable = {},
                    additional_vim_regex_highlghting = true,
                },

                indent = {
                    enable = true,
                    disable = { "yaml" },
                },

                -- Causes E13: File Exists (add ! to override), error to appear
                -- when saving c header files.
                --rainbow = {
                --enable = true,
                --disable = { "c", "cpp" },
                --extended_mode = true,
                --query = 'rainbow-parens',
                --strategy = require("ts-rainbow.strategy.global"),
                --},
            })
        end,
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
}