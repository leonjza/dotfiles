#!/bin/bash
#
# dotfiles configuration script
#

prereqs=(vim zsh tmux curl)

for i in "${prereqs[@]}"
do
	command -v $i >/dev/null 2>&1 || { echo \
		"I require $i but it's not installed.  Aborting." >&2; exit 1; }
done

echo "[+] zsh setup."
echo "[+] downlding oh-my-zsh installer"
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o /tmp/zsh-install.sh
echo "[+] preventing installer from starting zsh"
sed -i -r "s/env zsh//" /tmp/zsh-install.sh
echo "[+] running oh-my-zsh installer"
sh -c "$(cat /tmp/zsh-install.sh)"
echo "[+] installing zsh-syntax-highlighting"
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo "[+] installing zsh-autosuggestions"
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "[+] downloading .zshrc"
curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/zshrc -o ~/.zshrc
echo "[+] cleaning up the downloaded installer"
rm -f /tmp/zsh-install.sh

echo "[+] vim setup"
mkdir -p ~/.vim/
echo "[+] downloading vundle"
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
echo "[+] downloading molokai colorscheme"
git clone https://github.com/tomasr/molokai ~/.vim/bundle/molokai
echo "[+] downloading .vimrc"
curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/vimrc -o ~/.vimrc
echo "[+] running vundle PluginInstall"
vim +PluginInstall +qall

echo "[+] tmux setup"
curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/tmux.conf -o ~/.tmux.conf

echo "[!] DONE"

