# Command Aliases
#
# Generally, any commands that start with `alias` should live here.
# Checks can be done to see if a command exists before building
# the alias.

# Access to this dotfile installer
alias dotfiles="bash <(curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/install)"

# Simple aliases
alias chain="proxychains4 -q"
alias please='sudo $(fc -ln -1)'
alias p="passpie"
alias nah="git reset --hard;git clean -df"

# Alias Screensaver on osx as afk. My Mac locks when it starts.
if [[ -f "/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine" ]]; then
    alias afk="open -a ScreenSaverEngine"
fi

# Alias Sublime Text 3 if installed on macOS
if [[ -f "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ]]; then
    alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
fi

# Alias ports to lsof for tcp connections
if hash lsof 2>/dev/null; then
    alias ports='sudo lsof -iTCP -sTCP:LISTEN -P'
fi

# Alias locate on macOS to Spotlights mdfind -name
if hash mdfind 2>/dev/null; then
    alias locate="mdfind -name"
fi
