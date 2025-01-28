-- Side kick plugins (sorry for the term)
return {
    -- Disabled
    --'akinsho/bufferline.nvim',
    --'edluffy/hologram.nvim',
    -- 'mhinz/vim-startify',

    'andweeb/presence.nvim',
    'kylechui/nvim-surround',

    {
        'RaafatTurki/hex.nvim',
        config = function()
            local hex_view = require('hex')

            local key_set = vim.keymap.set;
            local opts = {}
            hex_view.setup({
                dump_cmd = 'xxd -g 1 -u',
                assemble_cmd = 'xxd -r',

                is_buf_binary_pre_read = function()
                    -- logic that determines if a buffer contains binary data or not
                    -- must return a bool
                end,

                -- function that runs on BufReadPost to determine if it's binary or not
                is_buf_binary_post_read = function()
                    -- logic that determines if a buffer contains binary data or not
                    -- must return a bool
                end,
            })

            key_set('n', '<leader>hh', hex_view.toggle, opts)
        end,
    },

    -- The enemy of all vim/nvim users... Big Files
    -- Maybe this can help
    "LunarVim/bigfile.nvim",
}
