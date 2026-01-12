# Command Aliases
#
# Generally, any commands that start with `alias` should live here.
# Checks can be done to see if a command exists before building
# the alias.

# Simple aliases

# git aliases
alias g="git"
alias glog="git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset\""
alias gcl="git clone --recurse-submodules"
alias gss="git status --short -b"

# fancy cat via bat. remove lines, borders and the pager with -pp
if hash bat 2>/dev/null; then
    alias cat="bat -pp"
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

# Reset changes in a git repository with a confirmation prompt
function nah() {
    if ! hash git 2>/dev/null; then
        return 1
    fi

    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Not a git repository."
        return 1
    fi

    echo "This will run: git reset --hard; git clean -df"
    read -r "reply?Type 'yes' to continue: "
    if [[ $reply == "yes" ]]; then
        git reset --hard
        git clean -df
    else
        echo "Aborted."
    fi
}

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

# eza! https://github.com/eza-community/eza
if hash eza 2>/dev/null; then
    alias ls='eza'
fi
