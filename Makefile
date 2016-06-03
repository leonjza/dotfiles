# Dotfiles
# June 2016 | @leonjza
#
# For more info, refer to the README at https://github.com/leonjza/dotfiles

# Default target is to just install everything
.DEFAULT_GOAL := install

# Command existance checks
preq = vim zsh curl git tmux
_ := $(foreach exec,$(preq), $(if $(shell which $(exec)), _, $(error No $(exec) in PATH. Install it first)))

# Locations
zsh_installer = /tmp/zsh-install.sh
oh_my_zsh = ~/.oh-my-zsh
zsh_rc = ~/.zshrc
vim_plugin_dir = ~/.vim
vim_rc = ~/.vimrc
tmux_conf = ~/.tmux.conf

zsh_install:
	$(info [+] Running Zsh setup)
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o $(zsh_installer)
	curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/shasums/zsh-install.sh -o $(zsh_installer).shasum
	shasum -c $(zsh_installer).shasum
	sed -i -r "s/env zsh//" $(zsh_installer)
	sh $(zsh_installer)
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $(oh_my_zsh)/custom/plugins/zsh-syntax-highlighting
	git clone git://github.com/zsh-users/zsh-autosuggestions $(oh_my_zsh)/custom/plugins/zsh-autosuggestions
	curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/zshrc -o $(zsh_rc)

zsh_cleanup:
	$(info [+] Cleaning up Zsh installer)
	rm -f $(zsh_installer)

vim_install:
	$(info [+] Running Vim setup)
	mkdir -p $(vim_plugin_dir)
	git clone https://github.com/gmarik/Vundle.vim $(vim_plugin_dir)/bundle/Vundle.vim
	git clone https://github.com/tomasr/molokai $(vim_plugin_dir)/bundle/molokai
	curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/vimrc -o $(vim_rc)
	vim +PluginInstall +qall

tmux_install:
	$(info [+] Running Tmux setup)
	curl -fsSL https://raw.githubusercontent.com/leonjza/dotfiles/master/tmux.conf -o $(tmux_conf)

clean: zsh_cleanup
install: zsh_install vim_install tmux_install clean
uninstall:
	$(info [+] Uninstalling. Logout of this shell when done.)
	rm -Rf $(oh_my_zsh)
	rm -f $(zsh_rc)
	rm -Rf $(vim_plugin_dir)
	rm -f $(vim_rc)
	rm -f $(tmux_conf)

