-- Snippets
return {
    'honza/vim-snippets',

    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            'honza/vim-snippets',
        },

        config = function()
            local ls = require("luasnip")
            local ls_snipmate = require("luasnip.loaders.from_snipmate")

            ls_snipmate.load()
            ls_snipmate.lazy_load({
                vim.fn.stdpath("data") .. "/lazy/vim-snippets/snippets",
            })

            vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    },
}
