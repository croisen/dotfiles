local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug('andweeb/presence.nvim')
    Plug('HiPhish/nvim-ts-rainbow2')
    Plug('mhinz/vim-startify')
    Plug('morhetz/gruvbox')
    Plug('nvim-tree/nvim-tree.lua')
    Plug('nvim-tree/nvim-web-devicons')
    Plug('preservim/nerdcommenter')
    Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
    Plug('neoclide/coc.nvim', { branch = 'release' })
vim.call('plug#end')
