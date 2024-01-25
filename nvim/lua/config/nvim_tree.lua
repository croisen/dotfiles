local ok, config = pcall(require, 'nvim-tree')

if not ok then
    vim.print("Nvim tree failed to load")
    return
end

vim.g.nvim_tree_auto_open = 1

config.setup({
    sort_by = "case_sensitive",

    view = {
        width = 30,
    },

    renderer = {
        group_empty = true,
    },

    filters = {
        dotfiles = false,
    },
})
