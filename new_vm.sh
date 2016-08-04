#!/bin/sh

apt-get install git-core ssh curl
apt-get update && apt-get upgrade && apt-get dist-upgrade && apt-get update
wget -qO- https://get.docker.com/ | sh
