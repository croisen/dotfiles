local on_attach = require("config.keybinds").on_attach

local servers = {
    "clangd",
    "cmake",
    "rust_analyzer",

    "gopls",
    "lua_ls",
    "pylsp",

    "html",
    "markdown_oxide",
}

local formatters = {
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },

    json = { "prettier" },
    yaml = { "prettier" },

    python = { "isort", "black" },
}

-- Stack overflow moment
--- @param result table?
--- @param ... table
local function flatten(result, ...)
    if result == nil then
        result = {}
    end

    for _, v in pairs({ ... }) do
        if type(v) == "table" then
            flatten(v, result)
        else
            table.insert(result, v)
        end
    end

    return result
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "mason-org/mason-lspconfig.nvim",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            vim.diagnostic.config({
                virtual_text = true,
                signs = false,
                underline = true,
                severity_sort = true,
            })

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        telemetry = { enable = false },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                                vim.fn.stdpath("data") .. "/lazy",
                            },
                        },
                        runtime = { version = "LuaJIT" },
                    },
                },
            })

            vim.lsp.enable(servers)
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            'saadparwaiz1/cmp_luasnip',
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-emoji",
            "hrsh7th/cmp-cmdline",
            "dmitmel/cmp-cmdline-history",
            "https://codeberg.org/FelipeLema/cmp-async-path",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp",   priority = 7 },
                    { name = 'luasnip',    option = { use_show_condition = false } },
                    { name = "async_path", priority = 4 },
                }),
            })

            cmp.setup.cmdline({ "/", "?", ":", "@" }, {
                mapping = cmp.mapping.preset.cmdline(),
                matching = { disallow_symbol_nonprefix_matching = false },
                sources = {
                    { name = "buffer",          priority = 4 },
                    { name = "cmdline",         priority = 5 },
                    { name = "cmdline-history", priority = 7 },
                    { name = "async_path",      priority = 6 },
                },
            })
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets",
            "honza/vim-snippets",
        },
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip.loaders.from_snipmate').lazy_load()
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = servers,
            automatic_enable = false,
        },
    },
    {
        "mason-org/mason.nvim",
        dependencies = { "stevearc/conform.nvim" },
        config = function()
            local mason = require("mason")
            local reg = require("mason-registry")
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            local fmts = flatten(formatters, nil)
            reg.refresh(function(ok, _)
                if not ok then
                    vim.notify("[lsp] Failed to update meson registry", vim.log.levels.ERROR)
                end
            end)
            for _, formatter in ipairs(fmts) do
                if reg.is_installed(formatter) then
                    goto continue
                end

                local ok, pkg = pcall(reg.get_package, formatter)
                if not ok then
                    vim.notify("[lsp] Failed to get formatter from mason", vim.log.levels.ERROR)
                    goto continue
                end

                local name = pkg.name
                local ver = pkg.get_latest_version(pkg)
                pkg:install({ version = ver }):once(
                    "closed",
                    vim.schedule_wrap(function()
                        if pkg:is_installed() then
                            vim.notify("[lsp] Installed formatter " .. name)
                        else
                            vim.notify(
                                ("[lsp] failed to install %s. Installation logs are available in :Mason and :MasonLog")
                                :format(
                                    name
                                ),
                                vim.log.levels.ERROR
                            )
                        end
                    end)
                )

                ::continue::
            end
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            format_on_save = {
                async = false,
                quiet = false,
                timeout_ms = 5000,
                lsp_format = "fallback",
            },
            formatters_by_ft = formatters,
        },
    },
}
