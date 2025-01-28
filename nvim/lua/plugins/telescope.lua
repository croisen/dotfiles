-- I'm way to used having a file tree open on the left
-- but I still use this to find what I forgot
return {
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope-media-files.nvim',

    {
        'nvim-telescope/telescope.nvim',
        branch = "0.1.x",
        dependencies = {
            'nvim-lua/plenary.nvim',

            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-media-files.nvim',
        },

        config = function()
            local tele_key = require('telescope.builtin')

            local key_set = vim.keymap.set;
            local opts = {}
            require('telescope').setup({
                extensions = {
                    media_files = {
                        filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "pdf" },
                        find_cmd = "rg",
                    },
                }
            })

            key_set('n', '<leader>ff', tele_key.find_files, opts)
            key_set('n', '<leader>fg', tele_key.live_grep, opts)
            key_set('n', '<leader>fb', tele_key.buffers, opts)
            key_set('n', '<leader>fh', tele_key.help_tags, opts)
        end,
    },
}
