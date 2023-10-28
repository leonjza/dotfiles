# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="af-magic"

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
plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker docker-compose extract httpie colored-man-pages fzf)

# Load up Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Clear the RPROMPT that af-magic has
RPROMPT=""

# Update theme to not include the horizontal ---- line
PROMPT='$FG[032]%~\
$(git_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'

# If you want to have the hostname as part of the prompt, edit
# ./.zshrc.d/local.zsh and add the line:
# PROMPT="%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"

# Adding your own configurations should be done by adding .zsh files
# to the following directory:
#   ~/.zshrc-local.d/

# Load all *.zsh files from ./rc.d directory.
MYPATH=$(dirname "$0")
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
