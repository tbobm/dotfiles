#!/bin/bash
export GITHUB_CONFIG=~/etc/MyConfiguration
export GITHUB_CONFIGURATION_FILE=~/.gitconfig
export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTIGNORE="&:ls:[bf]g:exit:l:h:cd"
export CHEATCOLORS=true
export EDITOR=/usr/local/bin/vim
export GOPATH=~/usr/w/go
export GOROOT=/usr/local/go
export EDITOR_CONFIG=~/.vimrc
export FTPLUGIN=~/.config/nvim/ftplugin/.
export CONFIG_SHELL_BOB=~/.bashrc
export Z_HOME=~/etc/z/z.sh
export CLANG_FORMAT_CONFIG=~/.clang-format
export GOBIN=$GOPATH/bin
export CABAL_BIN=~/.cabal/bin
export RUST_BIN=~/.cargo/bin
export PATH=$PATH:/usr/local/go/bin:/usr/local/go:~/bin:$GOBIN:$CABAL_BIN:$RUST_BIN
export ASDF_HOME=~/etc/asdf
export TERMINAL=konsole
export MAKEOPTS="-j5"


shopt -s histappend
shopt -s cmdhist
set -o vi
bind 'set show-mode-in-prompt on'

alias ..="cd .."
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias chx="chmod 755"
alias scratch="cd /tmp"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
alias ls="ls --color"
alias l="ls "
alias ll="ls -l"
alias la="ls -a"
alias EB='$EDITOR $CONFIG_SHELL_BOB; source $CONFIG_SHELL_BOB'
alias EV='$EDITOR $EDITOR_CONFIG'
alias EC='$EDITOR $CLANG_FORMAT_CONFIG'
alias EG='$EDITOR $GITHUB_CONFIGURATION_FILE'
alias EI='$EDITOR ~/.config/i3/config'
alias EP='$EDITOR ~/.config/i3status/config'
alias Rbash='source $CONFIG_SHELL_BOB'
alias v='$EDITOR'
alias vi='$EDITOR'
alias vim='$EDITOR'
alias j="jobs"
alias h="history"
alias wt="wtfaliases"
alias tuc="top_used_commands"
alias less='less -FSRX'
alias da="docker ps -a"
alias remove_untagged_images="docker images | grep '<none>' | grep -P '[1234567890abcdef]{12}' -o | xargs -L1 docker rmi"
alias RUI="remove_untagged_images"
alias ga="git add"
alias gp="git push"
alias gc="git commit -m"
alias gl="git pull"
alias gs="git status --porcelain"
alias gd="git diff"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gb="git branch"
alias gba="git branch --all"
alias gq="git-quick-stats "
alias gF="git-clang-format-3.8"
alias sst="svn st"
alias sa="svn add "
alias sr="svn revert"
alias sci="svn ci -m "
alias python="python3.5"
alias prospector="prospector -s veryhigh"
alias nmap="docker run -it --rm networkstatic/nmap "
alias redis="docker run -d --rm -p 6379:6379 --name redis redis"

function wtfaliases {
    echo "Your aliases containing $1 are:"
    pygmentize -g $CONFIG_SHELL_BOB | grep -C 1 "$1"
}

function gotosleep {
        sudo shutdown "+$1"
}

function parse_git_branch {
	BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

function parse_git_dirty {
	status=$(git status 2>&1 | tee)
	dirty=$(echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?")
	untracked=$(echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?")
	ahead=$(echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?")
	newfile=$(echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?")
	renamed=$(echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?")
	deleted=$(echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?")
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

function top_used_commands {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n15
}

function etna_time {
	curl -v --silent https://prepintra.etna-alternance.net 2>&1 | grep Date | sed -e 's/< Date: //'
}

function dockerlint {
        docker run -it --rm --privileged -v "$(pwd)":/root/ projectatomic/dockerfile-lint dockerfile_lint
}

function yaml2json {
        python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)' < "$1" > "${2:-file.json}"
}

function is_done {
        notify-send -u critical $*
}

function add_tern {
        cp $GITHUB_CONFIG/tpl/ternbase ./.tern-project
        printf "%s\n" "Added ternfile"
        cat .tern-project
}

thefuck --alias &> /dev/null
if [ $? == 0 ];
then
    eval "$(thefuck --alias)"
fi

export PS1="\[\e[34m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[34m\]\W\[\e[m\]\`parse_git_branch\` "

for f in ~/etc/completions/*;
do
        source "$f"
done
eval "$(register-python-argcomplete coala)"
COMPLETE_CLIMATE=/etc/bash_completion.d/climate_completion

[ -f $COMPLETE_CLIMATE ] && source $COMPLETE_CLIMATE
[ -f $ASDF_HOME/asdf.sh ] && source $ASDF_HOME/asdf.sh
[ -f $ASDF_HOME/completion/asdf.bash ] && source $ASDF_HOME/completion/asdf.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f $Z_HOME ] && source $Z_HOME

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.env ] && source ~/.env
echo "Have a nice day, Devops."
