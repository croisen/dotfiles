local ok, lazy = pcall(require, 'lazy')

if not ok then
    return
end

lazy.setup({
    --'andweeb/presence.nvim',
    'HiPhish/nvim-ts-rainbow2',
    'honza/vim-snippets',
    'kylechui/nvim-surround',
    'mhinz/vim-startify',
    'morhetz/gruvbox',
    'nvim-lua/plenary.nvim',
    'nvim-lualine/lualine.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'preservim/nerdcommenter',
    { 'neoclide/coc.nvim', branch = "release", },
})

require("user.editor_opts")
require("user.keybinds")
require("user.colorscheme")

require("user.coc")
require("user.lualine")
require("user.nvim_surround")
require("user.nvim_tree")
require("user.ultisnips")
require("user.treesitter")
