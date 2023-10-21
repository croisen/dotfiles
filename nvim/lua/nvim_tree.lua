local status_ok, config = pcall(require, 'nvim-tree')

if not status_ok then
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
