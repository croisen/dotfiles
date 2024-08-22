local ok, lazy = pcall(require, 'lazy')

if not ok then
    return
end

lazy.setup({
    -- Disabled
    --'akinsho/bufferline.nvim',
    --'andweeb/presence.nvim',
    --'edluffy/hologram.nvim',

    -- Colors
    'folke/tokyonight.nvim',
    'morhetz/gruvbox',
    'UtkarshVerma/molokai.nvim',

    -- Dependencies of other plugins?
    'nvim-lua/plenary.nvim',

    -- Side kick plugins (sorry for the term)
    'honza/vim-snippets',
    'kylechui/nvim-surround',
    'mhinz/vim-startify',
    'nvim-lualine/lualine.nvim',
    'preservim/nerdcommenter',
    'RaafatTurki/hex.nvim',

    -- I'm way to used having a file tree open on the left but still used to
    -- find what I forgot
    { 'nvim-telescope/telescope.nvim', branch = "0.1.x" },
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope-media-files.nvim',

    -- Thanks Sublime and VS Code to making me used to file trees on the left...
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- Treesitter
    'HiPhish/nvim-ts-rainbow2',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',

    { 'neoclide/coc.nvim',             branch = "release", },
})
