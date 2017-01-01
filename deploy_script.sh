#!/bin/bash


mkdir -p usr/w/{work,scripts} bin etc/{MyConfiguration,clones}

ssh-keygen 

cd etc/MyConfiguration/

# Installing git
sudo apt-get install -y git git-core

git init
git remote add origin https://github.com/massard-t/MyConfiguration
git fetch --all
git checkout master

# Linking to github's bashrc
rm ~/.bashrc 

ln -s ~/etc/MyConfiguration/UserSettings/bash_profile ~/.bashrc

cd ~

# Installing common dependencies
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-dev python-pip python3-dev python3-pip

# Installing golang
wget -O golang https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz
sudo tar -zxvf golang -C /usr/local/go
mkdir -p ~/usr/w/work

# Installing firefox
sudo apt-get install -y firefox

# Installing neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.local/share/nvim/plugged
