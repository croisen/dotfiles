--local ok, path = pcall(require, 'path')
--if not ok then
--vim.print("path failed to load")
--return
--end

local ok, mason = pcall(require, 'mason')
if not ok then
    vim.print("Mason failed to load")
    return
end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    vim.print("lspconfig failed to load")
    return
end

local ok, lsp_format = pcall(require, 'lsp-format')
if not ok then
    vim.print("lsp-format failed to load")
    return
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
    vim.print("cmp_nvim_lsp failed to load")
    return
end

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
    vim.print("mason-lspconfig failed to load")
    return
end

local lsp_default = lspconfig.util.default_config
lsp_default.capabilities = vim.tbl_deep_extend(
    "force",
    lsp_default.capabilities,
    cmp_nvim_lsp.default_capabilities()
)

lsp_default.on_attach = lsp_format.on_attach

mason.setup({
    install_root_dir = vim.fn.stdpath("data") .. "/mason",
    PATH = "prepend",
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",
        "cmake",
        "rust_analyzer",
        "zls",

        "gopls",
        "lua_ls",

        "pyright",

        "html",
        "markdown_oxide",

        "tsserver",
    },
})

lspconfig.clangd.setup({})
lspconfig.cmake.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.zls.setup({})

lspconfig.gopls.setup({})

lspconfig.pyright.setup({})

lspconfig.html.setup({})
lspconfig.markdown_oxide.setup({})

lspconfig.tsserver.setup({})

lspconfig.lua_ls.setup({
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

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    end
})
