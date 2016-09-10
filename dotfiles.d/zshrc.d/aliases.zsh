# Simple aliases
alias chain="proxychains4 -q"
alias please='sudo $(fc -ln -1)'
alias p="passpie"
alias nah="git reset --hard;git clean -df"

# Alias ports to lsof for tcp connections
if hash lsof 2>/dev/null; then
    alias ports='sudo lsof -iTCP -sTCP:LISTEN -P'
fi

# Alias locate on OSX to Spotlights mdfind -name
if hash mdfind 2>/dev/null; then
    alias locate="mdfind -name"
fi
