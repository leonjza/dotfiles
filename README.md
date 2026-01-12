# ⚡️.dotfiles | batteries included dotfile configurations

This repository contains my public dotfiles. It uses `stow` to manage symlinks and a small helper script for backups.

## installing

You probably want to fork this repo unless you are happy with exactly what I have here. Regardless, clone the repo somewhere. This will become the source of your dotfiles too.

A Nerd Font is recommended for prompt icons (for example, from [Nerd Fonts](https://www.nerdfonts.com/)).

With the font installed and configured to be used in your terminal, clone the repo:

```bash
git clone https://github.com/leonjza/dotfiles.git
cd dotfiles
```

Once cloned, stow the configurations.

```bash
./install stow
```

You can also run `./install backup` to back up existing configs first, or `./install stow --dry-run` to preview backups.

## overrides

If you want to override anything, or, include something that should not live in a git repo, then add your own `.zsh` files to `~/.zshrc-local.d`. Files ending with the `.zsh` extention in this path will be sourced when the shell starts.

## uninstalling

If for any reason you just cant get to like these configurations, removing them should be as easy as:

```bash
./install unstow
```

Configuration backups would have been made to the `~/.config/dotfile-backups/` directory.

## updating

If there are new changes that you want to pull, simply git pull this repo.

```bash
cd /path/to/dotfiles
git pull
```

As everything is a symlink to the repo you'd typically just need to reload your shell (i.e., open a new tab).

## backups

During operation, the installer tries to create backups where it deems it to be the right thing to do. Backups are located at `~/.config/dotfile-backups/`.

## whats included

Configurations for `zsh`, `neovim` and `tmux`!  
These dotfiles contain a number of maybe surprising things! Lets take a quick look.

### zsh

| Command        | Type           | Source  | Description |
| ------------- |:-------------:|:------:| ------------|
| `chain`      | alias      | [view](zsh/.zshrc.d/aliases.zsh) | Convenience alias to `proxychains` |
| `nah` | function | [view](zsh/.zshrc.d/aliases.zsh) | Reset tracked and untracked changes in the current git repo (with confirmation) |
| `ports` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Convenience alias to view open ports on macOS |
| `locate` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Convenience alias to make `mdfind` behave like `locate` on macOS |
| `updatesoftware` | zsh function | [view](zsh/.zshrc.d/functions.zsh) | Update software in major package managers, zimfw, and Neovim plugins |
| `newcryptvol` | zsh function | [view](zsh/.zshrc.d/functions.zsh) | Create a new encrypted volume on macOS |
