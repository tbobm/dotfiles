#!/bin/bash
# ~/.bashrc made by Theo Massard

# @env variables
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
export CONFIG_SHELL_BOB=~/.bashrc # CONFIG_SHELL happens to sometime be a script variable
export Z_HOME=~/etc/z/z.sh
export CLANG_FORMAT_CONFIG=~/.clang-format
export GOBIN=$GOPATH/bin
export CABAL_BIN=~/.cabal/bin
export RUST_BIN=~/.cargo/bin
export PATH=$PATH:/usr/local/go/bin:/usr/local/go:~/bin:$GOBIN:$CABAL_BIN:$RUST_BIN
export ASDF_HOME=~/etc/asdf
export TERMINAL=konsole
export MAKEOPTS="-j5"

# @z opti cd
if [ -f $Z_HOME ];
then
        # shellcheck source=/dev/null
        source $Z_HOME
fi

# @history
shopt -s histappend
shopt -s cmdhist

# Vi mode
set -o vi
bind 'set show-mode-in-prompt on'

# Frequent commands
alias ..="cd .."
alias rm='rm -i' # @M.F
alias cp='cp -i' # @M.F
alias mv='mv -i' # @M.F
alias chx="chmod 755" # @O.P
alias scratch="cd /tmp"
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
# Pretty ls
alias ls="ls --color" # @LS
alias l="ls " # @LS
alias ll="ls -l" # @LS
alias la="ls -a" # @LS
# Configuration management
alias EB='$EDITOR $CONFIG_SHELL_BOB; source $CONFIG_SHELL_BOB' # @O.C
alias EV='$EDITOR $EDITOR_CONFIG' # @O.C
alias EC='$EDITOR $CLANG_FORMAT_CONFIG'
alias EG='$EDITOR $GITHUB_CONFIGURATION_FILE' # @ O.C
alias EI='$EDITOR ~/.config/i3/config'
alias EP='$EDITOR ~/.config/i3status/config'
# Reload configuration
alias Rbash='source $CONFIG_SHELL_BOB' # @O.B
alias v='$EDITOR'
alias vi='$EDITOR'
alias vim='$EDITOR'
alias j="jobs"
alias h="history"
alias wt="wtfaliases"
# Stats
alias tuc="top_used_commands" # @O.B
# Format piped content
alias less='less -FSRX' # @O.M
# Docker
alias da="docker ps -a" # @O.D
alias remove_untagged_images="docker images | grep '<none>' | grep -P '[1234567890abcdef]{12}' -o | xargs -L1 docker rmi" # @O.D
alias RUI="remove_untagged_images" # @O.D
# Versionning
## Github
alias ga="git add" # @G.G
alias gp="git push" # @G.G
alias gc="git commit -m" # @G.G
alias gl="git pull" # @G.G
alias gs="git status --porcelain" # @G.G
alias gd="git diff" # @G.G
alias gf="git fetch" # @G.G
alias gfa="git fetch --all" # @G.G
alias gb="git branch" # @G.G
alias gba="git branch --all" # @G.G
alias gq="git-quick-stats "
alias gF="git-clang-format-3.8"
## Svn
alias sst="svn st"
alias sa="svn add "
alias sr="svn revert"
alias sci="svn ci -m "
# Installs
## Pip
alias spip="pip freeze > requirements.txt"
# Exercism.io
alias E="exercism "
alias EF="exercism fetch "
alias EC="exercism submit "
# Languages
## Haskell
alias ghc='stack exec -- ghc'
alias ghci='stack exec -- ghci'
## Python
alias python="python3.5"
alias prospector="prospector -s veryhigh"
# Utils
alias nmap="docker run -it --rm networkstatic/nmap "
alias redis="docker run -d --rm -p 6379:6379 --name redis redis"

# Functions

function wtfaliases {
    echo "Your aliases containing $1 are:"
    pygmentize -g $CONFIG_SHELL_BOB | grep -C 1 "$1"
}

function gotosleep {
        sudo shutdown "+$1"
}

# get current branch in git repo
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

# get current status of git repo
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

# ETNA
## CPP
function add_makefile_cpp { # TODO: Fix me before next CPP project
	local MAKEFILE_LOC="$HOME/usr/w/etna/prep02/FDI-COBJ/useful/Makefile"
	echo "Adding Makefile from :  $MAKEFILE_LOC"
	cp "$MAKEFILE_LOC" .
	printf "Done. \n"
	$EDITOR ./Makefile
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

### Custom aliases (auto-completion)
thefuck --alias &> /dev/null
if [ $? == 0 ];
then
    eval "$(thefuck --alias)"
fi

# Prompt
export PS1="\[\e[34m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[34m\]\W\[\e[m\]\`parse_git_branch\` "

# Completion
for f in ~/etc/completions/*;
do
# shellcheck source=/dev/null
        source "$f"
done
eval "$(register-python-argcomplete coala)"
COMPLETE_CLIMATE=/etc/bash_completion.d/climate_completion
if [ -f $COMPLETE_CLIMATE ];
then
# shellcheck source=/dev/null
	source $COMPLETE_CLIMATE
fi

if [ -f $ASDF_HOME/asdf.sh ];
then
# shellcheck source=/dev/null
	source $ASDF_HOME/asdf.sh
fi

if [ -f $ASDF_HOME/completion/asdf.bash ];
then
# shellcheck source=/dev/null
	source $ASDF_HOME/completion/asdf.bash
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "Have a nice day, Devops."

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
