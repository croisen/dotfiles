-- LSP Downloader
return {
    {
        'williamboman/mason.nvim',
        opts = {
            install_root_dir = vim.fn.stdpath("data") .. "/mason",
            PATH = "prepend",
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
        },
    },

    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },

        opts = {
            ensure_installed = {
                -- "arduino_language_server",
                "clangd",
                -- "cmake",
                "rust_analyzer",
                "zls",

                "gopls",
                "lua_ls",

                "html",
                "marksman",

                "jdtls",
                "jedi_language_server",
                -- "r_language_server",
                "ts_ls",
            },
        },
    },
}
