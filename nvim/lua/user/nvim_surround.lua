local ok, config = pcall(require, 'nvim-surround')

if not ok then
    return
end

config.setup()
