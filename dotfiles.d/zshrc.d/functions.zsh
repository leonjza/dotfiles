# Functions
#
# Any extra shell functions should live here. I guess this
# could go in aliases.zsh, but heh.

# List the filetypes in a directory
function filetypes() {

    local directory=$1

    # If we dont have a directory, make it the current
    if [[ $directory == "" ]]; then
        directory="."
    fi

    # Ensure the directory is valid
    if [[ ! -d $directory ]]; then
        echo "$directory is not a valid directory."
        return
    fi

    find . -maxdepth 1 -print0 | xargs -0 file -k | grep -v directory
}

# Encode a URL
function urlencode() {

    local url=$1

    if [[ $url == "" ]]; then
        echo "A string is needed to encode"
        return
    fi

    python -c "import urllib as u; print(u.quote_plus('$url'));"
}

# Decode a string that may have been URL encoded
function urldecode() {

    local string=$1

    if [[ $string == "" ]]; then
        echo "A string is needed to decode"
        return
    fi

    python -c "import urllib as u; print(u.unquote_plus('$string'));"
}

# Update the software from major package managers and the base OS
function updatesoftware() {

    # Update ZSH Plugins
    AUTO_SUGGEST="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    if [[ -d $AUTO_SUGGEST ]]; then

        echo " * Updating auto suggestions plugin"
        pushd . > /dev/null
        cd $AUTO_SUGGEST
        git pull
        popd > /dev/null

    fi

    SYNTAX_HIGHLIGHT="$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    if [[ -d $SYNTAX_HIGHLIGHT ]]; then

        echo " * Updating syntax highlighting plugin"
        pushd . > /dev/null
        cd $SYNTAX_HIGHLIGHT
        git pull
        popd > /dev/null

    fi

    # Oh-My-Zsh
    if type upgrade_oh_my_zsh >/dev/null; then

        echo " * Updating oh-my-zsh"
        upgrade_oh_my_zsh

    fi

    # VIM plugins
    if hash vim 2>/dev/null; then

        echo " * Upgrading VIM plugins"
        vim +PluginUpdate +qall
    fi

    # Upgrade Homebrew
    if hash brew 2>/dev/null; then

        echo " * Upgrading Homebrew, packages and casks"
        brew upgrade
        brew cask upgrade

        echo " * Performing brew cleanup"
        brew cleanup
    fi

    # Composer global libraries
    if hash composer 2>/dev/null; then

        echo " * Updating composer itself"
        composer self-update

        echo " * Upgrading Composer global"
        composer global update

    fi

    # Update Debian based OS
    if hash apt-get 2>/dev/null; then

        echo " * Updating OS via apt"
        sudo apt-get update && sudo apt-get upgrade -y

        echo " * Cleaning up packages"
        sudo apt-get autoremove -y

    fi

    # Update Redhat based OS
    if hash yum 2>/dev/null; then

        echo " * Updating OS via yum"
        sudo yum update -y

    fi

    # Update macOS based OS. First try and use mas:
    #   brew install mas
    if hash mas 2>/dev/null; then

        echo " * Updating macOS using mas"
        mas upgrade

    else

        # Fallback to softwareupdate
        if hash softwareupdate 2>/dev/null; then

            echo " * 'mas' not installed. Falling back to softwareupdate"
            echo " * Updating macOS using softwareupdate"
            sudo softwareupdate -i -a

        fi
    fi

}

# gpg[de]crypt based on:
#   https://github.com/SixArm/gpg-encrypt/blob/master/gpg-encrypt
function gpgencrypt() {

    local file=$1

    gpg --symmetric --cipher-algo aes256 --digest-algo sha256 --cert-digest-algo sha256 -z 0 --compress-algo none --quiet --no-greeting "$file"
}

function gpgdecrypt() {

    local file=$1

    gpg --decrypt "$file" > "$file"decrypted

    echo "Output saved to $file.decrypted"
}

# Helper method to update the computers hostname
function sethostname() {

    local hostname=$1

    echo "Updating hostname to: "$hostname

    if hash scutil 2>/dev/null; then

        echo "Using macOS method..."

        sudo scutil --set ComputerName "$hostname"
        sudo scutil --set LocalHostName "$hostname"
        sudo scutil --set HostName "$hostname"

    fi

    if hash hostnamectl 2>/dev/null; then

        echo "Using systemd method..."

        hostnamectl set-hostname "$hostname"

    fi

    echo "Hostname updated."
}

function b64decode () {

    if hash gbase64 2>/dev/null; then
        echo "$1" | gbase64 -d ; echo

        return
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
