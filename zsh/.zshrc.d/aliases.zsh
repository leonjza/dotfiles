# Command Aliases
#
# Generally, any commands that start with `alias` should live here.
# Checks can be done to see if a command exists before building
# the alias.

# Simple aliases

# Quick history search
alias hgrep="history | grep -i"

# Kill jobs in the current session
alias killjobs='echo $(jobs -p | awk "{ print $3 }") | xargs -t kill -9'

# Clean and restore the prompt for screenshots or something
alias cprompt="PS1BAK=\$PS1 && PS1=\"$ \""
alias oprompt="PS1=\$PS1BAK"

# git shorthand
alias g="git"

# cleanup .DS_Store rubbish
alias rmds="find . -name '*.DS_Store' -type f -delete"

# Alias ports to lsof for tcp connections
if hash lsof 2>/dev/null; then
    alias ports="sudo lsof -iTCP -sTCP:LISTEN -P"
fi

# Alias locate on macOS to Spotlights mdfind -name
if hash mdfind 2>/dev/null; then
    alias locate="mdfind -name"
fi

# Make gdb quiet on start
if hash gdb 2>/dev/null; then
    alias gdb="gdb -q"
fi

# Alias nah to reset changes in a git repository
if hash git 2>/dev/null; then
    alias nah="git reset --hard;git clean -df"
fi

# alias vim to neovim
if hash nvim 2>/dev/null; then
    alias vim="nvim"
fi

# Alias proxychains. macOS & brew seems to have it as proxychanins4
# and *everywhere* else its just proxychains
if hash proxychains 2>/dev/null || hash proxychains4 2>/dev/null; then
    if hash proxychains 2>/dev/null; then
        alias chain="proxychains -q"
    else
        alias chain="proxychains4 -q"
    fi
fi

# Alias httpie & method to just the method
if hash http 2>/dev/null; then
    for method in get post put delete; do
        alias $method="http $method"
    done

fi

# Python Tools
if hash python3 2>/dev/null; then
    alias httpserver="python3 -m http.server 0"
fi

# use rsync for cp == progress indicator!
if hash rsync 2>/dev/null; then
    alias rcp="rsync -ah --inplace --info=progress2"
fi

# exa! https://the.exa.website/
if hash eza 2>/dev/null; then
    alias ls='eza'
fi

# Create a preview command!
# https://remysharp.com/2018/08/23/cli-improved#fzf--ctrlr
if hash fzf 2>/dev/null; then
    if hash bat 2>/dev/null; then
        alias preview="fzf --preview 'bat --color \"always\" {}'"
    else
        alias preview="fzf --preview 'cat {}'"
    fi
fi
