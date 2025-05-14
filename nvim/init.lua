require("colors")
require("editor_opts")
require("keybinds")

if vim.fn.has("nvim-0.11") == 1 then
    require("lsp")
    require("statusline")
else
    vim.notify("This config only supports nvim 0.11+", vim.log.levels.ERROR)
end
