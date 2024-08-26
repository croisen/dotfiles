local ok, cmp = pcall(require, 'cmp')
if not ok then
    return
end

local ok, luasnip = pcall(require, 'luasnip')
if not ok then
    return
end

local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then
    return
end

local ok, git = pcall(require, 'cmp_git')
if not ok then
    return
end

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_prev_item(),
        ["<C-p>"] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),

    sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },

        {
            name = "buffer",
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        },
    },

    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer", },
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "buffer", },
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            },
        },
    }),
})

-- For nvim-autopairs
--cmp.event:on(
    --'confirm_done',
--)

-- For cmp-git
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, {
        { name = 'buffer' },
    })
})

git.setup()

require("lua.config.lsp.clangd")
require("lua.config.lsp.cmake")
require("lua.config.lsp.gopls")
require("lua.config.lsp.lua_ls")
require("lua.config.lsp.rust_analyzer")
require("lua.config.lsp.tsserver")
require("lua.config.lsp.zls")
