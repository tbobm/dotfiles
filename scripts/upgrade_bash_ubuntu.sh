#!/bin/bash
set -euoix

readonly BASH_DIR=/tmp/bash-4.4
mkdir $BASH_DIR || true
#sudo apt-get install build-essential
#wget -O /tmp/bash-4.4.tar.gz http://ftp.gnu.org/gnu/bash/bash-4.4.tar.gz
tar -xvf /tmp/bash-4.4.tar.gz -C $BASH_DIR --strip-components=1
(cd $BASH_DIR && ./configure)
(cd $BASH_DIR && make)
(cd $BASH_DIR && sudo make install)
