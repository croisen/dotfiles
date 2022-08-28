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
set wildmode=longest,list
syntax on
tab all

" Plugins
call plug#begin()
    Plug 'honza/vim-snippets'
    Plug 'mhinz/vim-startify'
    Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'SirVer/ultisnips'
    Plug 'tomasr/molokai'
call plug#end()

" Keybinds - Mostly from the site below
" https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84
" But since I was used to sublime text, it's gonna be changed a bit
inoremap <C-Up> <Esc>:m .-2<CR>==gi
inoremap <C-Down> <Esc>:m .+1<CR>==gi
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv

" Ez escape
inoremap ii <Esc>

" Panel stuff, but I don't know what that is yet
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Colors
if (has("termguicolors"))
    set termguicolors
    syntax enable
    colorscheme molokai
endif
