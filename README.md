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
