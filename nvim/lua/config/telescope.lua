local ok, config = pcall(require, 'nvim-treesitter.configs')

if not ok then
    vim.print("Telescope failed to load")
    return
end

--config.load_extension('media_files')

config.setup({
    extensions = {
        media_files = {
            filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "pdf" },
            find_cmd = "rg",
        },
    },
})
