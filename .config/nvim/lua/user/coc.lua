vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.updatetime = 300

vim.opt.signcolumn = "yes"

local key_set = vim.keymap.set
local opts = {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = false,
}

key_set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
key_set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
key_set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
key_set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
key_set("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})


-- Symbol renaming
key_set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code
key_set("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
key_set("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})


-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})
