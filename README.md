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
| `g` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Shortcut for `git` |
| `gp` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Shortcut for `git pull` |
| `glog` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Pretty git graph log |
| `gcl` | alias | [view](zsh/.zshrc.d/aliases.zsh) | `git clone --recurse-submodules` |
| `gss` | alias | [view](zsh/.zshrc.d/aliases.zsh) | `git status --short -b` |
| `dce` | alias | [view](zsh/.zshrc.d/aliases.zsh) | `docker compose exec` (or `docker-compose exec`) |
| `dcps` | alias | [view](zsh/.zshrc.d/aliases.zsh) | `docker compose ps` (or `docker-compose ps`) |
| `dcstop` | alias | [view](zsh/.zshrc.d/aliases.zsh) | `docker compose stop` (or `docker-compose stop`) |
| `dcup` | alias | [view](zsh/.zshrc.d/aliases.zsh) | `docker compose up` (or `docker-compose up`) |
| `dcdn` | alias | [view](zsh/.zshrc.d/aliases.zsh) | `docker compose down` (or `docker-compose down`) |
| `dcl` | alias | [view](zsh/.zshrc.d/aliases.zsh) | `docker compose logs` (or `docker-compose logs`) |
| `dclf` | alias | [view](zsh/.zshrc.d/aliases.zsh) | `docker compose logs -f` (or `docker-compose logs -f`) |
| `dcpull` | alias | [view](zsh/.zshrc.d/aliases.zsh) | `docker compose pull` (or `docker-compose pull`) |
| `cat` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Uses `bat -pp` when `bat` is installed |
| `ports` | alias | [view](zsh/.zshrc.d/aliases.zsh) | View listening TCP ports via `lsof` (macOS) |
| `locate` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Uses `mdfind -name` on macOS |
| `gdb` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Runs `gdb -q` when `gdb` is installed |
| `vim` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Maps `vim` to `nvim` when installed |
| `chain` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Uses `proxychains -q` or `proxychains4 -q` |
| `ls` | alias | [view](zsh/.zshrc.d/aliases.zsh) | Uses `eza` when installed |
| `take` | function | [view](zsh/.zshrc.d/functions.zsh) | Create directory and `cd` into it |
| `updatesoftware` | function | [view](zsh/.zshrc.d/functions.zsh) | Update common package managers and zimfw |
| `nah` | function | [view](zsh/.zshrc.d/functions.zsh) | Reset tracked + untracked git changes (with confirmation) |
| `newcryptvol` | function | [view](zsh/.zshrc.d/functions.zsh) | Create a new encrypted sparse volume on macOS |
