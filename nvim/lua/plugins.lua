-- What neovim plugins I use


local status_ok, lazy = pcall(require, 'lazy')
if status_ok then
    lazy.setup({
        'andweeb/presence.nvim',
        'BurntSushi/ripgrep',
        'HiPhish/nvim-ts-rainbow2',
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
        { 'neoclide/coc.nvim', branch = 'release' },
    })
end

require("colorscheme")
require("editor_opts")
require("keybinds")
require("coc")
require("lualine")
require("nvim_surround")
require("nvim_tree")
require("treesitter")
