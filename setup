#!/bin/bash

set -e

REPO_NAME="MyConfiguration"
DOTFILES_DIR=~/$REPO_NAME
PIP_FILE=$DOTFILES_DIR/about_me/pip_list.txt
mkdir -p ~/.emacs.d/

sudo apt-get install git-core emacs24-nox ssh python-pip
git clone http://github.com/massard-t/$REPO_NAME $DOTFILES_DIR
cd $DOTFILES_DIR
if ! [ -f ~/.bashrc]
then
    cat ./UserSettings/bash_profile > ~/.bashrc
else
    cat ./UserSettings/bash_profile >> ~/.bashrc
fi

cp -r ./emacs/* ~/.emacs.d/.

pip install -r $PIP_FILE
