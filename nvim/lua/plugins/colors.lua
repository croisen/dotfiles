-- Colors
return {
    {
        'morhetz/gruvbox',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("gruvbox")
        end,
    },

    'folke/tokyonight.nvim',
    'UtkarshVerma/molokai.nvim',
}
