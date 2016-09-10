# Path to your oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker extract httpie colored-man-pages)

# Load up Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Clear the RPROMPT
RPROMPT=""

# Load all *.zsh files from ~/.dotfiles.d/zshrc.d directory
if [ -d $HOME/.shellrc/zshrc.d ]; then

  for file in $HOME/.shellrc/zshrc.d/*.zsh; do
    source $file
  done

fi
