#!/bin/sh

help() {
    {
	echo "User: find_not_documented [--help | --setup] [PATH]"
	echo " --help prints this help"
	echo " --setup copies this file to /bin and /sbin"
	echo "Looks recusively and prints the filename of every"
	echo "shell script that doesn't have a help() function"
    }
}

setup() {
    cp ./find_not_documented.sh /bin/find_not_documented
    chmod +x /bin/find_not_documented
    cp ./find_not_documented.sh /sbin/find_not_documented
    chmod +x /sbin/find_not_documented
    echo "FND is now installed"
}

find_files() {
    grep -L --include=\*.sh -rnw ${1-$(pwd)} -e "help()"
}



case "$1" in
    --help) help
	    ;;
    --setup) setup
	     ;;
    *) find_files $1
       ;;
esac
