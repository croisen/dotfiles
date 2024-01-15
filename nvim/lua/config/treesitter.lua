local ok, configs = pcall(require, 'nvim-treesitter.configs')

if not ok then
    return
end

configs.setup {
    ensure_maintained = "all",
    sync_install = false,
    ignore_installs = { "" },

    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlghting = true,
    },

    indent = {
        enable = true,
        disable = { "yaml" },
    },

    -- Causes E13: File Exists (add ! to override), error to appear
    -- when saving c header files.
    --rainbow = {
    --enable = true,
    --disable = { "" },
    --extended_mode = true,
    --query = 'rainbow-parens',
    --strategy = require("ts-rainbow.strategy.global"),
    --},
}
