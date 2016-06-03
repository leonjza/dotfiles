# dotfiles
Dotfile Configurations

This repository contains my public dotfiles. It includes a `Makefile` for installation. By default, everyting is installed. If you only wanted certain parts, then run `make` and the name of the part you want.

## installation
```bash
curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/Makefile && make
````

## uninstall
```bash
make uninstall
```

## available parts

```bash
make zsh_install
make vim_install
make tmux_install
```
