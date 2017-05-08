#!/usr/bin/env bash
# Made with love by Theo `Bob` Massard
# set -euo pipefail

#/ Usage:
#/ Description:
#/ Examples:
#/ Options:
#/   --help: Display this help message
usage() { grep '^#/' "$0" | cut -c4- ; exit 0 ; }
expr "$*" : ".*--help" > /dev/null && usage

readonly LOG_FILE="/tmp/$(basename "$0").log"
info()    { echo "[INFO]    $*" | tee -a "$LOG_FILE" >&2 ; }
warning() { echo "[WARNING] $*" | tee -a "$LOG_FILE" >&2 ; }
error()   { echo "[ERROR]   $*" | tee -a "$LOG_FILE" >&2 ; }
fatal()   { echo "[FATAL]   $*" | tee -a "$LOG_FILE" >&2 ; exit 1 ; }

exists() {
        type "$1" >/dev/null 2>&1
}


install_nativefier() {
        npm install -g nativefier 2>&1
}

check_utils() {
        if [[ $(exists "npm") -eq 0 ]];
        then
                info "I have npm"
        else
                error "Unable to find npm"
                exit 1
        fi
        if [[ $(exists "nativefier") -eq 0 ]];
        then
                info "Found nativefier."
        else
                warning "Couldn't find nativefier. Installing it right now."
                install_nativefier
        fi
}


if [[ "${BASH_SOURCE[0]}" = "$0" ]]; then
    trap cleanup EXIT
    check_utils
    # Script goes here
    # ...
    while [[ $# -gt 1 ]]
    do
            key=$1
            case $key in
                    -u|--url)
                            url="$2"
                            shift
                            ;;
                    -n|--name)
                            name="$2"
                            shift
                            ;;
                    -h|--help)
                            show_help
                            exit 0
                            ;;
            esac
            shift
    done

    URL=$url
    NAME=${name:-"My app"}
    echo "VARS"
    echo "URL=$URL"
    echo "NAME=$NAME"

    nativefier --name "$NAME" "$URL"

fi
