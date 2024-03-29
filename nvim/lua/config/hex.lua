local ok, config = pcall(require, 'hex')
if not ok then
    return
end

config.setup({
    dump_cmd = 'xxd -g 1 -u',
    assemble_cmd = 'xxd -r',

    is_buf_binary_pre_read = function()
        -- logic that determines if a buffer contains binary data or not
        -- must return a bool
    end,

    -- function that runs on BufReadPost to determine if it's binary or not
    is_buf_binary_post_read = function()
        -- logic that determines if a buffer contains binary data or not
        -- must return a bool
    end,
})
