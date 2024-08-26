local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then
    return
end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities()
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = {
              'vim',
              'require'
            },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
    },
})
