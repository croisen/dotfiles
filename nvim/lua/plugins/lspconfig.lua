return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/nvim-cmp',

            'lukas-reineke/lsp-format.nvim',

            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },

        config = function()
            local lspconfig = require("lspconfig")
            local lsp_default = lspconfig.util.default_config
            lsp_default.capabilities = vim.tbl_deep_extend(
                "force",
                lsp_default.capabilities,
                require("cmp_nvim_lsp").default_capabilities()
            )

            lsp_default.on_attach = require("lsp-format").on_attach

            lspconfig.arduino_language_server.setup({})
            lspconfig.clangd.setup({})
            lspconfig.cmake.setup({})
            lspconfig.rust_analyzer.setup({})
            lspconfig.zls.setup({})

            lspconfig.gopls.setup({})

            lspconfig.html.setup({})
            lspconfig.marksman.setup({})

            lspconfig.jdtls.setup({})
            lspconfig.jedi_language_server.setup({})
            lspconfig.r_language_server.setup({})

            lspconfig.ts_ls.setup({})

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
        end,
    },
}
