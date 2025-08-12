local M = {}
local key_set = vim.keymap.set
local opts = { noremap = true, silent = true, }

-- Resizing the splits
key_set('n', '<c-a-up>', ":2wincmd +<cr>", opts)
key_set('n', '<c-a-left>', ":2wincmd <<cr>", opts)
key_set('n', '<c-a-down>', ":2wincmd -<cr>", opts)
key_set('n', '<c-a-right>', ":2wincmd ><cr>", opts)

-- Escape terminal mode
key_set('t', '<esc>', "<c-\\><c-n>", opts)

-- Nvim lsp
key_set('n', '<leader>dd', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

function M.on_attach(client, buffer)
    opts.buffer = buffer
    key_set('n', 'gd', vim.lsp.buf.definition, opts)
    key_set('n', 'gD', vim.lsp.buf.declaration, opts)
    key_set('n', 'K', vim.lsp.buf.hover, opts)
    key_set('n', 'gi', vim.lsp.buf.implementation, opts)
    key_set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    key_set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    key_set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    key_set('n', '<Leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    key_set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
    key_set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
    key_set('n', '<Leader>ca', vim.lsp.buf.code_action, opts)
    key_set('n', 'gr', vim.lsp.buf.references, opts)
end

return M
