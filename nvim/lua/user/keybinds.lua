local key_set = vim.keymap.set

-- Move the lines around, whether in normal or visual mode
key_set('i', '<c-up>', '<esc>:m .-2<cr>==gi')
key_set('i', '<c-down>', '<esc>:m .+1<cr>==gi')
key_set('v', '<c-up>', ":m '<-2<cr>gv=gv")
key_set('v', '<c-down>', ":m '>+1<cr>gv=gv")

-- Move the placement of the split
key_set('n', '<a-up>', "<c-w>K")
key_set('n', '<a-left>', "<c-w>H")
key_set('n', '<a-down>', "<c-w>J")
key_set('n', '<a-right>', "<c-w>L")

-- Move to other splits
key_set('n', '<c-up>', ":wincmd k<cr>")
key_set('n', '<c-left>', ":wincmd h<cr>")
key_set('n', '<c-down>', ":wincmd j<cr>")
key_set('n', '<c-right>', ":wincmd l<cr>")

-- Resizing the splits
key_set('n', '<c-a-up>', ":2wincmd +<cr>")
key_set('n', '<c-a-left>', ":2wincmd <<cr>")
key_set('n', '<c-a-down>', ":2wincmd -<cr>")
key_set('n', '<c-a-right>', ":2wincmd ><cr>")

-- Escape terminal mode
key_set('t', '<esc>', "<c-\\><c-n>")

-- Remove highlight search
key_set('n', '<Leader>n', ":noh<cr>")

-- Open nvim-tree
key_set('n', '<Leader>f', ":NvimTreeToggle<cr>")

-- Telescope
local ok, tele_key = pcall(require, 'telescope.builtin')

if not ok then
    return
else
    key_set('n', '<leader>ff', tele_key.find_files, {})
    key_set('n', '<leader>fg', tele_key.live_grep, {})
    key_set('n', '<leader>fb', tele_key.buffers, {})
    key_set('n', '<leader>fh', tele_key.help_tags, {})
end
