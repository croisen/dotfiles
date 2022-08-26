filetype plugin indent on
let g:coc_disable_startup_warning = 1
set autoindent
set backupdir=~/.cache/nvim
set cc=80
set clipboard=unnamedplus
set cursorline
set expandtab
set ignorecase
set nocompatible
set nu rnu
set hlsearch
set incsearch
set mouse=a
set mouse=v
set tabstop=4
set ttyfast
set shiftwidth=4
set showmatch
set spell
" set softtabstop=4
set wildmode=longest,list
syntax on

call plug#begin()
Plug 'tomasr/molokai'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

if (has("termguicolors"))
    set termguicolors
    syntax enable
    colorscheme molokai
endif
