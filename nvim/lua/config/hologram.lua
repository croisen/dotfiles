local ok, config = pcall(require, 'hologram')

if not ok then
    vim.print("Hologram failed to load")
    return
end

config.setup({
    auto_display = true,
})
