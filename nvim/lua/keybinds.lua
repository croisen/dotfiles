local key_set = vim.keymap.set
local opts = { noremap = true, silent = true, }

-- Resizing the splits
key_set('n', '<c-a-up>', ":2wincmd +<cr>", opts)
key_set('n', '<c-a-left>', ":2wincmd <<cr>", opts)
key_set('n', '<c-a-down>', ":2wincmd -<cr>", opts)
key_set('n', '<c-a-right>', ":2wincmd ><cr>", opts)

-- Escape terminal mode
key_set('t', '<esc>', "<c-\\><c-n>", opts)
