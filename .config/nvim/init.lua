-- My init.vim converted to init.lua

local config_files = {
	"editor_opts.lua",
	"plugins.lua",
	"colorscheme.lua",
	"keybinds.lua",
	"treesitter.lua",
}

-- Dunno if I need to load it like this or require can just be used
for _, file in ipairs(config_files) do
	local path = string.format("%s/lua/user/%s", vim.fn.stdpath("config"), file)
	vim.cmd("source " .. path)
end
