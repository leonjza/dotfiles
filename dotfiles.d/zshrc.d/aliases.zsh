# Command Aliases
#
# Generally, any commands that start with `alias` should live here.
# Checks can be done to see if a command exists before building
# the alias.

# Simple aliases

# Access to this dotfile installer
alias dotfiles="bash <(curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/install)"

# Please do the last command as sudo
alias please='sudo $(fc -ln -1)'

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

# Alias passpie password manager. Install with: brew install passpie
if hash passpie 2>/dev/null; then
    alias p="passpie"
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
