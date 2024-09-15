-- Side kick plugins (sorry for the term)
return {
    -- Disabled
    --'akinsho/bufferline.nvim',
    --'andweeb/presence.nvim',
    --'edluffy/hologram.nvim',

    'mhinz/vim-startify',
    'kylechui/nvim-surround',

    {
        'RaafatTurki/hex.nvim',
        opts = {
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
        },
    },

    -- The enemy of all vim/nvim users... Big Files
    -- Maybe this can help
    "LunarVim/bigfile.nvim",
}
