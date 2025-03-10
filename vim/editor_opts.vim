set list
set listchars=space:·,tab:-> 

set autoindent
set backup!
set background=dark
set cc=80
set clipboard=unnamedplus
set cursorline
set expandtab
set ignorecase
set nu
set rnu
set hlsearch
set incsearch
set modeline
set modelines=5
set mouse=a
set nocompatible
set path+=**
set shiftwidth=4
set showcmd
set showmatch
set showmode
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
set viminfo+=n~/.config/vim/viminfo

colorscheme gruvbox

if (has("termguicolors"))
    set termguicolors
endif

command! MakeTags !ctags -R .

syntax enable
filetype plugin on
