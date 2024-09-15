-- I'm way to used having a file tree open on the left but still used to
-- find what I forgot
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

        opts = {
            extensions = {
                media_files = {
                    filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "pdf" },
                    find_cmd = "rg",
                },
            },
        },
    },
}
