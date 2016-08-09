#!/bin/sh

function up_to_date() {
    apt-get update
    apt-get upgrade
    apt-get dist-upgrade
    apt-get update
}

    apt-get install -y git-core ssh curl npm
