local status_ok, configs = pcall(require, 'nvim-treesitter.configs')

if not status_ok then
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

    rainbow = {
        enable = true,
        disable = { "" },
        extended_mode = true,
        query = 'rainbow-parens',
        strategy = require("ts-rainbow.strategy.global"),
    },
}
