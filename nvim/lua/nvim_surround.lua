local status_ok, config = pcall(require, 'nvim-surround')

if not status_ok then
    return
end

config.setup()
