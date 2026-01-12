# Functions
#
# Any extra shell functions should live here. I guess this
# could go in aliases.zsh, but heh.

function take() {
  [[ -n $1 ]] && mkdir -p -- "$1" && builtin cd -- "$1"
}

# Update the software from major package managers and the base OS
function updatesoftware() {

    local now
    function _us_header() {
        now=$(date +"%H:%M:%S")
        echo
        echo "==> [$now] $1"
    }

    # Update zimfw and its modules
    if type zimfw >/dev/null 2>&1; then
        _us_header "Updating zimfw and modules"
        zimfw update
    else
        _us_header "Skipping zimfw (not installed)"
    fi

    # Update Neovim plugins via Lazy
    if hash nvim 2>/dev/null; then
        _us_header "Updating Neovim plugins (Lazy)"
        nvim --headless "+Lazy! sync" +qa
    else
        _us_header "Skipping Neovim (not installed)"
    fi

    # Upgrade Homebrew
    if hash brew 2>/dev/null; then
        _us_header "Upgrading Homebrew, packages and casks"
        brew update
        brew upgrade
    else
        _us_header "Skipping Homebrew (not installed)"
    fi

    # Update Debian based OS
    if hash apt-get 2>/dev/null; then
        _us_header "Updating OS via apt"
        sudo apt-get update && sudo apt-get upgrade -y

        _us_header "Cleaning up apt packages"
        sudo apt-get autoremove -y

    fi

    # Update Redhat based OS
    if hash yum 2>/dev/null; then
        _us_header "Updating OS via yum"
        sudo yum update -y
    fi

}

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

# Create a new encrypted vol
function newcryptvol () {

    if hash hdiutil 2>/dev/null; then

        local vol=$1
        echo "Creating new volume: $vol"
        hdiutil create -size 15GB -encryption AES-256 -type SPARSE -fs apfs -volname "$vol" $vol
    else
        echo "Could not find hdiutil, this is probably not macOS"
    fi
}
