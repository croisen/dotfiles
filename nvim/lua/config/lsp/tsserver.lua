local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then
    return
end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities()
lspconfig.tsserver.setup({
    capabilities = capabilities,
})
