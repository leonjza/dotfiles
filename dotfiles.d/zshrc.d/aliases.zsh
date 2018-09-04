# Command Aliases
#
# Generally, any commands that start with `alias` should live here.
# Checks can be done to see if a command exists before building
# the alias.

# Simple aliases

# Access to this dotfile installer
alias dotfiles="bash <(curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/install)"

# Quick history search
alias hgrep="history | grep -i"

# Kill jobs in the current session
alias killjobs='echo $(jobs -p | awk "{ print $3 }") | xargs -t kill -9'

# Alias Screensaver on macOS High Sierra as afk. My Mac locks when it starts.
if [[ -f "/System/Library/CoreServices/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine" ]]; then
    alias afk="open -a ScreenSaverEngine"
fi

# Alias Sublime Text 3 if installed on macOS
if [[ -f "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ]]; then
    alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
fi

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

# Python2 Tools
if hash python2 2>/dev/null; then

    alias httpserver="python2 -m SimpleHTTPServer 0"

fi

# alias cat to bat: https://github.com/sharkdp/bat
if hash bat 2>/dev/null; then

    alias cat='bat'

fi

# exa! https://the.exa.website/
if hash exa 2>/dev/null; then

    alias ls='exa'
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
