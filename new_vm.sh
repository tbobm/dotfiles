#!/bin/bash

AGY="apt-get install -y"
AG="apt-get"

set -x
function up_to_date() {
    $AG update
    $AG upgrade -y
    $AG dist-upgrade
    $AG update
}

function get_required_installer() {
    ./npm_glob_modules.sh
#    bash Installs/install_python3.5.sh
#    pip install -r about_me/pip_list.txt
}

function get_configuration() {
    rm -rf ~/.emacs.d/
    git clone --recursive http://github.com/massard-t/my_emacs ~/.emacs.d/
    echo ./UserSettings/bash_profile > ~/.bashrc
}

function install_dependencies() {
    $AGY git-core
    $AGY ssh
    $AGY curl
    $AGY npm
    $AGY python-pip
    $AGY python-dev
}

function install_opt_dependencies() {
    $AGY tree
    $AGY tmux
    $AGY emacs24-nox
    $AGY make
}

function complete_install() {
    up_to_date
    install_dependencies
    install_opt_dependencies
    get_configuration
    get_required_installer
}

case "$1" in
    --complete) complete_install
		;;
esac
set +x
