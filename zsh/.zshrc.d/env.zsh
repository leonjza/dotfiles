# ENV
#
# Any environment specific changes should live in here

# Ensure EDITOR is neovim, if possible
if hash nvim 2>/dev/null; then
    export EDITOR=nvim
fi

# Set locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
