# Commands
#
# Commands specified here run on shell startup

# Run pfetch if available, otherwise neofetch
if hash pfetch 2>/dev/null; then
    pfetch
elif hash neofetch 2>/dev/null; then
    neofetch
fi
