# Dotfiles

My own config files
Though these are just made from the modules that other people made:

## Installation

```sh
git clone "https://github.com/croisen/dotfiles.git"
cd dotfiles
stow --dir=./ --target=/home/$USER/.config ./
```

## GTK

-   The theme is [gruvbox-material-dark](https://github.com/TheGreatMcPain/gruvbox-material-gtk)
    by TheGreatMcPain
-   Slapped the themes on with lxappearance or nwg-look-bin
    (depending if I currently use awesomewm or hyprland)

## Kitty

-   The config is the default one though what I thought I didn't need, I just
    removed them from the config file
-   The colorscheme I use is [gruvbox-palette](https://github.com/morhetz/gruvbox-contrib)

## Neofetch

-   The config uses an alias to a logo and a config collected and modified by
    Chick2D, that being [neofetch-themes](https://github.com/Chick2D/neofetch-themes)

## Packages I needed

### External Apps

My config of [dwm](https://github.com/croisen/dwm)
My config of [dwmblocks](https://github.com/croisen/dwmblocks)

### Applications

```
audacious blueman cowsay firefox fortune-mod lolcat network-manager
qt5ct thunar
```

### Fonts

```
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
ttf-fira-code ttf-meslo-nerd
```

### Sound (Pipewire)

```
pavucontrol pipewire-alsa pipewire-audio pipewire-pulse wireplumber
```

### Window Manager (dwm)

```
dmenu lxappearance picom scrot slock xorg-xbacklight xorg-xset xsel
```

### Shell (zsh)

```
zsh zsh-autosuggestions zsh-completions
zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k
```
