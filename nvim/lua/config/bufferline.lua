local ok, config = pcall(require, 'bufferline')

if not ok then
    vim.print("Bufferline failed to load")
    return
end

config.setup({
    options = {
        diagnostics = "coc",
        style_preset = config.style_preset.default,
        themable = true,
        numbers = "ordinal",
        close_command = "bdelete! %d",
        indicator = {
            icon = "| ",
            style = "underline",
        },
        buffer_close_icon = 'x',
        modified_icon = "o",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = true
            }
        },
    },
})
