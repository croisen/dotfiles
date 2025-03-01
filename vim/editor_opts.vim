set list
set listchars=space:·,tab:-> 

set autoindent
set backup!
set cc=80
set clipboard=unnamedplus
set cursorline
set expandtab
set ignorecase
set nu
set rnu
set hlsearch
set incsearch
set mouse=a
set nocompatible
set path+=**
set shiftwidth=4
set showmatch
set showmode!
set signcolumn=yes
set spell!
set splitbelow
set splitright
set tabstop=4
set ttyfast
set updatetime=300
set wildmenu
set wildmode=longest,list
set writebackup!

if (has("termguicolors"))
    set termguicolors
endif

command! MakeTags !ctags -R .

syntax enable
filetype plugin on
