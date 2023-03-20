local cache_dir = os.getenv("HOME") .. "/.cache/nvim"

vim.g.rehash256 = 1
-- vim.g.UltiSnipsSnippetDirectories = os.getenv("HOME") .. "/.config/nvim/plugged/vim-snippets/UltiSnips"
vim.opt.autoindent = true
vim.opt.backupdir = cache_dir
vim.opt.cc = "100"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.mouse=a
vim.opt.mouse=v
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.spell = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop=4
vim.opt.termguicolors = true
vim.opt.ttyfast = true
vim.opt.wildmode = {'longest', 'list'}
vim.cmd("set nocompatible")
vim.cmd("tab all")
