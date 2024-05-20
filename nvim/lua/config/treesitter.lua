local ok, config = pcall(require, 'nvim-treesitter.configs')

if not ok then
    vim.print("Treesitter failed to load")
    return
end

config.setup {
    ensure_maintained = "all",
    sync_install = false,
    auto_install = true,
    ignore_installs = { "markdown" },

    highlight = {
        enable = true,
        disable = {},
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
    --disable = { "c", "cpp" },
    --extended_mode = true,
    --query = 'rainbow-parens',
    --strategy = require("ts-rainbow.strategy.global"),
    --},
}
