# ⚡️.dotfiles | batteries included dotfile configurations

This repository contains my public dotfiles. It comes with a single installer that will take care of installing, updating and backing up your existing configurations while using `stow`.

![shell](screenshots/shell.png)

## toc

- [installing](#installing)
- [uninstalling](#uninstalling)
- [updating](#updating)
- [backups](#backups)
- [whats included](#whats-included)

## installing

You probably want to fork this repo unless you are happy with exactly what I have here. Regardless, clone the repo somewhere. This will become the source of your dotfiles too.

```bash
git clone https://github.com/leonjza/dotfiles.git
cd dotfiles
```

Once cloned, run the setup install script.

```text
./install
      _       _    __ _ _
     | |     | |  / _(_) |
   __| | ___ | |_| |_ _| | ___  ___
  / _` |/ _ \| __|  _| | |/ _ \/ __|
 | (_| | (_) | |_| | | | |  __/\__ \
  \__,_|\___/ \__|_| |_|_|\___||___/
    by @leonjza
    https://github.com/leonjza/dotfiles

checking prerequisites...

git (required) is available
stow (required) is available
curl (required) is available
zsh (optional) is available
nvim (optional) is available

Usage: ./install <subcommand>
Subcommands:
  install     install software specific configuration
  usage       echo this usage information
  stow        stow configurations (aka, update symlinks)
  unstow      remove symlinks (removing configs)
```

If there are any errors, i.e., a required command is missing then you'd need to install those first.

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
| `chain`      | alias      | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/aliases.zsh) | Convenience alias to `proxychains` |
| `please` | alias  | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/aliases.zsh) | Run the last command again as root |
| `nah` | alias | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/aliases.zsh) | Convenience alias to undo all of your changes in the current git branch |
| `ports` | alias | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/aliases.zsh) | Convenience alias to view open ports on macOS |
| `locate` | alias | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/aliases.zsh) | Convenience alias to make `mdfind` behave like `locate` on macOS |
| `get`, `post`, `put`, `delete` | alias | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/aliases.zsh) | Convenience alias for `httpie $method` |
| `httpserver` | alias | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/aliases.zsh) | Convenience alias to start an HTTP server on an available open port |
| `killjobs` | alias | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/aliases.zsh) | Convenience alias to kill all jobs in the current session |
| `extract` | zsh plugin | [view](https://github.com/leonjza/dotfiles/blob/master/rc/zshrc) | _Very_ convenient alias plugin that lets you extract almost any archive with `extract something.tar.gz` |
| `urlencode`, `urldecode` | alias | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/functions.zsh) | Encode/Decode strings using url encoding |
| `filetypes` | zsh function | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/functions.zsh) | List files in a directory as well as their types according to `file` |
| `json` | zsh function | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/functions.zsh) | Output a file in pretty formatted json |
| `updatesoftware` | zsh function | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/functions.zsh) | Update software in major package managers and OS |
| `gpgencrypt` / `gpgdecrypt` | zsh function | [view](https://github.com/leonjza/dotfiles/blob/master/dotfiles.d/zshrc.d/functions.zsh) | Encrypt / Decrypt files using GPG |

Apart from the commands, there are also things like:

- A clean shell prompt. Shows current path and git branch of applicable.
- `git` command auto completion as well as visual indicators of your current working branch and if your local branch has uncommitted changes.
