# Dotfiles

My own config files
Though these are just made from the modules that other people made:

## Installation

Why stow? I wanted symlinks

```sh
git clone "https://github.com/croisen/dotfiles.git"
cd dotfiles
stow --dir=./ --target=$HOME/.config ./
```

## Packages I needed (Some are in the AUR)

### External Apps

-   [dwm](https://github.com/croisen/dwm)
-   [dwmblocks](https://github.com/croisen/dwmblocks)
-   [gruvbox-dark-gtk](https://github.com/jmattheis/gruvbox-dark-gtk)
-   [gruvbox-dark-icons-gtk](https://github.com/jmattheis/gruvbox-dark-icons-gtk)

-   [Grub Themes](https://github.com/xenlism/Grub-themes)
-   [Grub2 Themes](https://github.com/Generator/Grub2-themes)
-   [gruvbox-palette](https://github.com/morhetz/gruvbox-contrib)
-   [neofetch-themes](https://github.com/Chick2D/neofetch-themes)

### Applications

```
audacious blueman cowsay ffmpeg firefox fortune-mod fzf imagemagick kitty lolcat
networkmanager network-manager-applet neofetch neovim npm picom python3 qt5ct
ranger thunar tree-sitter-cli xdg-desktop-portal xdg-desktop-portal-gtk
xxd yarn yt-dlp zoxide
```

### Fonts

```
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
ttf-fira-code ttf-font-awesome ttf-meslo-nerd
```

### Sound (Pipewire)

```
pavucontrol pipewire-alsa pipewire-audio pipewire-pulse wireplumber
```

### Window Manager (dwm)

```
dmenu lxappearance picom scrot xorg-xbacklight xorg-xset xorg-xwininfo xsel
```

### Window Manager (hyprland)

```
cliphist grim hyprland hyprpaper mako nwg-look slurp
waybar wf-recorder wofi xdg-desktop-portal-hyprland
```

### Shell (zsh)

```
zsh zsh-autosuggestions zsh-completions
zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k
```
