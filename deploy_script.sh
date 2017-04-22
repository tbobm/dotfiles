#!/bin/bash

GO="${GOROOT:/usr/local/go}"
INSTALL="sudo apt-get install -y"
SET_ALT="sudo update-alternatives"
GO_URL="https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz"
CONFIG_REPO="https://github.com/massard-t/MyConfiguration"


function create_dirs_home {
	cd ~ || exit 1
	mkdir -p usr/w/{work,scripts} bin etc/{MyConfiguration,clones}
	ssh-keygen
}


function clone_configuration {
	#cd etc/MyConfiguration/ || exit 1

	# Installing git
	$INSTALL git git-core

	git init
	git remote add origin $CONFIG_REPO
	git fetch --all
	git checkout master

	# Linking to github's bashrc
	rm ~/.bashrc

	ln -s ~/etc/MyConfiguration/UserSettings/bash_profile ~/.bashrc

	wget https://raw.githubusercontent.com/Russell91/sshrc/master/sshrc ~/bin/sshrc
	chmod +x ~/bin/sshrc
	ln -s ~/etc/MyConfiguration/UserSettings/bash_profile ~/.sshrc
	cd ~ || exit 1
}


function install_common_properties {
	# Installing common dependencies
	$INSTALL software-properties-common
	$INSTALL python-dev python-pip python3-dev python3-pip
}


function install_golang {
	# Installing golang
	wget -O golang $GO_URL
	sudo tar -zxvf golang -C "$GO"
}


function install_firefox {
	# Installing firefox
	$INSTALL firefox
}

function install_neovim {
	# Installing neovim
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt-get update
	$INSTALL neovim

	$SET_ALT --install /usr/bin/vi vi /usr/bin/nvim 60
	$SET_ALT --config vi
	$SET_ALT --install /usr/bin/vim vim /usr/bin/nvim 60
	$SET_ALT --config vim
	$SET_ALT --install /usr/bin/editor editor /usr/bin/nvim 60
	$SET_ALT --config editor

	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	mkdir -p ~/.local/share/nvim/plugged
}

function _deploy {
		test
}
