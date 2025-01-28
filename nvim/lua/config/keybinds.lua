local key_set = vim.keymap.set
local opts = { noremap = true, silent = true, }

local function quickfix()
    vim.lsp.buf.code_action({})
end

-- Move the lines around, whether in normal or visual mode
key_set('i', '<c-up>', '<esc>:m .-2<cr>==gi', opts)
key_set('i', '<c-down>', '<esc>:m .+1<cr>==gi', opts)
key_set('v', '<c-up>', ":m '<-2<cr>gv=gv", opts)
key_set('v', '<c-down>', ":m '>+1<cr>gv=gv", opts)

-- Move the placement of the split
key_set('n', '<a-up>', "<c-w>K", opts)
key_set('n', '<a-left>', "<c-w>H", opts)
key_set('n', '<a-down>', "<c-w>J", opts)
key_set('n', '<a-right>', "<c-w>L", opts)

-- Move to other splits
key_set('n', '<c-up>', ":wincmd k<cr>", opts)
key_set('n', '<c-left>', ":wincmd h<cr>", opts)
key_set('n', '<c-down>', ":wincmd j<cr>", opts)
key_set('n', '<c-right>', ":wincmd l<cr>", opts)

-- Resizing the splits
key_set('n', '<c-a-up>', ":2wincmd +<cr>", opts)
key_set('n', '<c-a-left>', ":2wincmd <<cr>", opts)
key_set('n', '<c-a-down>', ":2wincmd -<cr>", opts)
key_set('n', '<c-a-right>', ":2wincmd ><cr>", opts)

-- Escape terminal mode
key_set('t', '<esc>', "<c-\\><c-n>", opts)

-- Remove highlight search
key_set('n', '<Leader>n', ":noh<cr>", opts)

-- Open nvim-tree
key_set('n', '<Leader>f', ":NvimTreeToggle<cr>")

-- QuickFix
key_set('n', '<leader>qf', quickfix, opts)

-- Bufferline
--key_set('n', 'gb', ":BufferLinePick<cr>", {})
