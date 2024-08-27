local ok, lsp_format = pcall(require, 'lsp-format')
if not ok then
    vim.print("lsp-format failed to load")
    return
end

lsp_format.setup({})
