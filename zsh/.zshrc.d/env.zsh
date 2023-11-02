# ENV
#
# Any environment specific changes should live in here

# Ensure bew bin (/usr/local/bin) is in PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# Ensure EDITOR is neovim, if possible
if hash nvim 2>/dev/null; then
    export EDITOR=nvim
fi

# Set locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# https://github.com/silvanocerza/dotfiles/blob/master/zsh/zshrc#L46
#
# If current selection is a text file shows its content,
# if it's a directory shows its content, the rest is ignored
FZF_CTRL_T_OPTS="--preview-window wrap --preview '
if [[ -f {} ]]; then
    file --mime {} | grep -q \"text\/.*;\" && bat --color \"always\" {} || (tput setaf 1; file --mime {})
elif [[ -d {} ]]; then
    exa -l --color always {}
else;
    tput setaf 1; echo YOU ARE NOT SUPPOSED TO SEE THIS!
fi'"
