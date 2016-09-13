# Completion
#
# Any shell command completion bootstrapping should live here

# Passpie
if hash passpie 2>/dev/null; then
    eval "$(passpie complete zsh)";
fi
