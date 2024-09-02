local ok, bigfile = pcall(require, 'bigfile')
if not ok then
    return
end

bigfile.setup({})
