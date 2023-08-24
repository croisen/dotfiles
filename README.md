# Dotfiles
My own config files
Though these are just made from the modules that other people made:

## Window Manager
### AwesomeWM
*   I used a prebuilt theme from [awesome-copycats](https://github.com/lcpz/awesome-copycats/)
*   The dependencies on the theme I use in awesome-copycats are:
    - Amixer
    - Dmenu
    - Pulseaudio
    - Xsel
*   The apps that have a shortcut key I assigned are:
    - Audacious
    - Blueman
    - Firefox
    - Scrot
    - Thunar
*   The apps that are auto started are:
    - Blueman
    - Picom
    - Network Manager
### Hyprland
*   Currently just the default config with keybinds similar to my awesomewm keybinds

## GTK
*   The theme is [gruvbox-material-dark](https://github.com/TheGreatMcPain/gruvbox-material-gtk) by TheGreatMcPain
*   Slapped the themes on with lxappearance or nwg-look-bin (depending if I currently use awesomewm or hyprland)

## Kitty
*   The config is the default one though what I thought I didn't need, I just removed them from the config file
*   The colorscheme I use is [gruvbox-palette](https://github.com/morhetz/gruvbox-contrib)

## Neofetch
*   The config uses an alias to a logo and a config collected and modified by Chick2D, 
that being [neofetch-themes](https://github.com/Chick2D/neofetch-themes)

## Neovim
* It uses [vim-plug](https://github.com/junegunn/vim-plug) as a package manager for neovim extensions
* With an increasing amount of extensions because the Lord knows I need more extensions

## Packages I needed
### Applications
```
audacious blueman cowsay firefox fortune-mod lolcat network-manager
noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra qt5ct thunar
ttf-fira-code ttf-meslo-nerd zsh-autosuggestions zsh-completions
zsh-history-substring-search zsh-syntax-highlighting zsh-theme-powerlevel10k zsh-vi-mode
```
### Sound (ALSA)
```
alsa-utils pavucontrol pulseaudio pulseaudio-alsa
```
### Sound (Pipewire)
```
pavucontrol pipewire-alsa pipewire-audio pipewire-pulse wireplumber
```
### Window Manager (Awesome)
```
awesome dmenu lxappearance picom scrot slock xorg-xset xsel
```
### Window Manager (Hyprland)
```
hyprland hyprpaper mako nwg-look-bin xdg-desktop-portal-hyprland waybar wofi
```
