--local function file_exists(file)
    --local isok, errstr, errcode = os.rename(file, file)
    --if isok == nil then
        --if errcode == 13 then
		--return true
        --end
	--return false
    --end
    --return true
--end

--local check = file_exists(os.getenv("HOME") .. "/.config/nvim/autoload/plug.vim")

--if not check then
    --local cmd = "\"curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    --\'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\'\""
    --os.execute("sh -c " .. cmd)
--end

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug('andweeb/presence.nvim')
    Plug('HiPhish/nvim-ts-rainbow2')
    Plug('mhinz/vim-startify')
    Plug('morhetz/gruvbox')
    Plug('nvim-tree/nvim-tree.lua')
    Plug('nvim-tree/nvim-web-devicons')
    Plug('preservim/nerdcommenter')
    Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
    Plug('neoclide/coc.nvim', { branch = 'release' })
vim.call('plug#end')
