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

# Print json string in a pretty formatted way
function json() {

	# Input is an argument
    if [[ -t 0 ]]; then

        python -mjson.tool <<< "$*"
        return

    fi

    # Input is a pipe
    python -mjson.tool

}

# Update the software from major package managers and the base OS
function updatesoftware() {

    # Upgrade Homebrew
    if hash brew 2>/dev/null; then

        echo " * Upgrading Homebrew"
        brew upgrade

        echo " * Cleaning old versions in Homebrew"
        brew cleanup

    fi

    # Composer global libraries
    if hash composer 2>/dev/null; then

        echo " * Upgrading Composer global"
        composer global update

    fi

    # Update Debian based OS
    if hash apt-get 2>/dev/null; then

        echo " * Updating OS via apt"
        sudo apt-get update && sudo apt-get upgrade -y

    fi

    # Update Redhat based OS
    if hash yum 2>/dev/null; then

        echo " * Updating OS via yum"
        sudo yum update -y

    fi

    # Update macOS based OS
    if hash softwareupdate 2>/dev/null; then

        echo " * Updating macOS using softwareupdate"
        sudo softwareupdate -i -a

    fi

}
