local ok, config = pcall(require, 'nvim-tree')

if not ok then
    return
end

config.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
