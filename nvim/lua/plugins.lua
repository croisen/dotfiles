local ok, lazy = pcall(require, 'lazy')

if not ok then
    return
end

lazy.setup({
    --'akinsho/bufferline.nvim',
    --'andweeb/presence.nvim',
    --'edluffy/hologram.nvim',
    'HiPhish/nvim-ts-rainbow2',
    'honza/vim-snippets',
    'kylechui/nvim-surround',
    'mhinz/vim-startify',
    'morhetz/gruvbox',
    'nvim-lua/plenary.nvim',
    'nvim-lualine/lualine.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope-media-files.nvim',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'preservim/nerdcommenter',
    'RaafatTurki/hex.nvim',
    { 'nvim-telescope/telescope.nvim', branch = "0.1.x" },
    { 'neoclide/coc.nvim',             branch = "release", },
})
