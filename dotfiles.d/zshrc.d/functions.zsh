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
