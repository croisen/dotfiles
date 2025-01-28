# Dotfiles

My own config files
Though these are just made from the modules that other people made:

## Installation

Why stow? I wanted symlinks

```sh
git clone "https://github.com/croisen/dotfiles.git" --recursive
cd dotfiles
stow --dir=./ --target=$HOME/.config ./
cp ~/.config/awesome/scripts/sp.nosecret ~/.config/awesome/scripts/sp
```

Edit the copied sp script with your spotify api token
(instructions are in the script as well)

## Packages

They are on this [gist](https://gist.github.com/croisen/2285d8203d18ef09b9b535e2c572c7a9)

### External Apps

#### Modified suckless apps

-   [dwm](https://github.com/croisen/dwm)
-   [dwmblocks](https://github.com/croisen/dwmblocks)

#### 3rd party config and bits for awesomewm

-   [arc-icon-theme](https://github.com/horst3180/arc-icon-theme)
-   [awesome-copycats](https://github.com/lcpz/awesome-copycats)
-   [freedesktop](https://github.com/lcpz/awesome-freedesktop)
-   [lain](https://github.com/lcpz/lain)
-   [sp](https://gist.github.com/mohit-rathee/bf22522caa6fbfc88d1cf3891a1a243e)
-   [streetturtle-widgets](https://github.com/streetturtle/awesome-wm-widgets)

#### Themes (helps to make me remember for a new Installation)

-   [Gruvbox-GTK-Theme](https://github.com/Fausto-Korpsvart/Gruvbox-GTK-Theme)
-   [Grub Themes](https://github.com/xenlism/Grub-themes)
-   [Grub2 Themes](https://github.com/Generator/Grub2-themes)
-   [gruvbox-palette](https://github.com/morhetz/gruvbox-contrib)
-   [neofetch-themes](https://github.com/Chick2D/neofetch-themes)

#### zsh stuff

-   [powerlevel10k](https://github.com/romkatv/powerlevel10k)
-   [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
-   [zsh-completions](https://github.com/zsh-users/zsh-completions)
-   [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
-   [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
