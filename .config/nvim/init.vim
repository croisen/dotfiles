filetype plugin indent on
let g:coc_disable_startup_warning = 1
let g:rehash256 = 1
let mapleader="\\"
set autoindent
set backupdir=~/.cache/nvim
set cc=100
set clipboard=unnamedplus
set cursorline
set expandtab
set ignorecase
set inccommand=nosplit
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
set splitright
set splitbelow
set wildmode=longest,list
syntax on
tab all

" Plugins
call plug#begin()
    "Plug 'andweeb/presence.nvim'
    "Plug 'dracula/vim'
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
" Ez swap lines
inoremap <C-Up> <Esc>:m .-2<CR>==gi
inoremap <C-Down> <Esc>:m .+1<CR>==gi
vnoremap <silent> <C-Up> :m '<-2<CR>gv=gv
vnoremap <silent> <C-Down> :m '>+1<CR>gv=gv

" Move the placements of the panels
nnoremap <A-Up> <C-W>K
nnoremap <A-Left> <C-W>H
nnoremap <A-Down> <C-W>J
nnoremap <A-Right> <C-W>L

" Switching to other panels
" From stackoverflow: https://stackoverflow.com/questions/6053301/...
" ...easier-way-to-navigate-between-vim-split-panes#6053341
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" Resizing panels
nmap <silent> <C-A-Up> :2wincmd +<CR>
nmap <silent> <C-A-Left> :2wincmd <<CR>
nmap <silent> <C-A-Down> :2wincmd -<CR>
nmap <silent> <C-A-Right> :2wincmd ><CR>

" Escape terminal mode
tnoremap <Esc> <C-\><C-n>

" Get rid of search highlight
nnoremap <silent> <leader>n :noh<CR>

" Colors
if (has("termguicolors"))
    set termguicolors
    syntax enable
    colorscheme molokai
endif
