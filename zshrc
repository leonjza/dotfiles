export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# Install syntax highlighter ater oh-my-zsh
# https://github.com/zsh-users/zsh-syntax-highlighting#with-oh-my-zsh
plugins=(git zsh-syntax-highlighting zsh-autosuggestions docker extract httpie)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/Users/leon.jacobs/.composer/vendor/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# Aliases
alias chain="proxychains4 -q"
alias please='sudo $(fc -ln -1)'

# Alias ports to lsof for tcp connections
if hash lsof 2>/dev/null; then
    alias ports='sudo lsof -iTCP -sTCP:LISTEN -P'
fi

# Alias locate on OSX to Spotlights mdfind -name
if hash mdfind 2>/dev/null; then
    alias locate="mdfind -name"
fi

# Clear the RPROMPT
RPROMPT=""

# Set passpie completion
if which passpie > /dev/null; then eval "$(passpie complete zsh)"; fi
