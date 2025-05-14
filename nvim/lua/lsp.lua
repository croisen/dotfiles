vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LocalLspAttach", { clear = true }),
    callback = function(ev)
        local key_set = vim.keymap.set
        local opts = { noremap = true, silent = true, }
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        key_set('i', '<c-space>', vim.lsp.completion.get, opts)
        key_set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        key_set('n', '<leader>fb', vim.lsp.buf.format, opts)
        key_set('n', '<leader>gd', vim.lsp.buf.definition, opts)
        key_set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
        key_set('n', '<leader>k', vim.lsp.buf.signature_help, opts)

        vim.lsp.completion.enable(true, client.id, ev.buf, {})
        local format_on_save =
            not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting')

        if format_on_save then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = ev.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end
})

vim.lsp.enable("clangd")
vim.lsp.enable("gopls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("rust-analyzer")
vim.lsp.enable("zls")
