local ok, config = pcall(require, 'nvim-surround')

if not ok then
    vim.print("Nvim surround failed to load")
    return
end

config.setup()
