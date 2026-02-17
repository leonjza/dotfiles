# ⚡️.dotfiles | batteries included dotfile configurations

![dotfiles preview](images/preview.png)

This repository contains my public dotfiles. It uses `stow` for symlink management and a helper script for backup + stow workflows.

## installing

Clone this repo somewhere and use it as the source of truth for your configs:

```bash
git clone https://github.com/leonjza/dotfiles.git
cd dotfiles
```

A Nerd Font is recommended for prompt icons (for example, from [Nerd Fonts](https://www.nerdfonts.com/)).

Then stow the managed configs:

```bash
./install stow
```

`stow` currently manages:
- `tmux`
- `zsh`
- `nvim`
- `starship`
- `zim`

Preview backup detection without making changes:

```bash
./install stow --dry-run
```

## recommended software

These dotfiles assume or enhance the following tools:

- `zsh` + `stow` (core shell + symlink manager)
- `git` (aliases and workflows)
- `neovim` (used by `vim` alias and editor setup)
- `tmux` (included configuration)
- `starship` (prompt setup in `.zshrc`)
- `bat` (pretty `cat` alias)
- `eza` (modern `ls` alias)
- optional: `ghostty` (config is in this repo but not stowed by `install`)

## overrides

To override defaults or keep machine-local secrets/settings out of git, add your own `.zsh` files to `~/.zshrc-local.d`. Any files ending in `.zsh` there are sourced on shell startup.

## uninstalling

Remove managed symlinks with:

```bash
./install unstow
```

This only removes symlinks for stowed packages. It does not automatically restore backups.

## updating

Pull latest changes in this repo:

```bash
cd /path/to/dotfiles
git pull
```

Because configs are symlinked, opening a new shell/tab is usually enough to pick up changes.

## backups

During `./install stow`, existing non-symlink configs that would conflict are moved to:

`~/.config/dotfile-backups/`

Backups keep their relative path (for example `~/.zshrc` -> `~/.config/dotfile-backups/.zshrc`).

## what's included

This repo includes configs for:

- `zsh`
- `nvim` (NvChad-based)
- `tmux`
- `starship`
- `zim`
- `ghostty` (manual use unless you stow it yourself)

### zsh helpers

| Command | Type | Source | Description |
| --- | :---: | :---: | --- |
| `chain` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Convenience alias to `proxychains` / `proxychains4` |
| `nah` | function | [view](zsh/.zshrc.d/functions.zsh) | Reset tracked and untracked changes in current git repo (with confirmation) |
| `ports` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Convenience alias to view listening TCP ports on macOS |
| `locate` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Convenience alias to make `mdfind` behave like `locate` on macOS |
| `updatesoftware` | function | [view](zsh/.zshrc.d/functions.zsh) | Update common package managers and zimfw |
| `newcryptvol` | function | [view](zsh/.zshrc.d/functions.zsh) | Create a new encrypted sparse volume on macOS |
