# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Timestamp history output
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(zsh-syntax-highlighting zsh-autosuggestions docker docker-compose extract httpie colored-man-pages fzf)

# Load up Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# If you want to have the hostname as part of the prompt, edit
# ./.zshrc.d/local.zsh and add the line:
# PROMPT="%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"

# Adding your own configurations should be done by adding .zsh files
# to the following directory:
#   ~/.zshrc-local.d/

# powerlevel10k prompt
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load all *.zsh files from ./rc.d directory.
MYPATH="$( cd -- "$(dirname -- "$0")" >/dev/null 2>&1 ; pwd -P )"
if [ -d $MYPATH/.zshrc.d ]; then
  for file in $MYPATH/.zshrc.d/*.zsh; do
    source $file
  done
fi

# Load all *.zsh files from the local ~/.zshrc-local.d directory.
# These are not in this repo as this path is intended for machine specific
# and or secret configs.
if [ -d $HOME/.zshrc-local.d ]; then
  for file in $HOME/.zshrc-local.d/*.zsh; do
    source $file
  done
fi
