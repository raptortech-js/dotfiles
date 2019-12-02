#! /bin/bash
# .bashrc is executed for interactive, login shells

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [[ $(uname) == "Darwin" ]]
then
	alias ls='ls -G'
	LOCAL="$HOME/.local/.darwin"
else
	export LS_OPTIONS="--color=auto"
	LOCAL="$HOME/.local"
fi

export PATH="$LOCAL/bin:$HOME/.cargo/bin:$HOME/.rvm/bin:/home/linuxbrew/.linuxbrew/bin:/usr/local/bin:/usr/local/sbin:/opt/X11/bin:/usr/bin:/usr/sbin:/bin:/sbin"

. "$HOME/.dotfiles/.bashrc-brandeis.sh"

export LD_LIBRARY_PATH="$LOCAL/lib"
export LD_RUN_PATH="$LOCAL/lib"
export LDFLAGS="-L$LOCAL/lib"
export CFLAGS="-I$LOCAL/include"
export MANPATH="$LOCAL/share/man:$LOCAL/man:/usr/share/man"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

if command -v dircolors > /dev/null
then
	eval "$(dircolors)"
fi

export EDITOR=vim

## Use a long listing format ##
alias ll='ls -la'

## Show hidden files ##
alias l.='ls -A'

alias xrdb_merge='xrdb -merge -I$HOME ~/.Xresources'

alias root='sudo -u root $(which fish)'

alias alia_shell='sudo bash -c "source ~/ssh-agent-data && $(which fish)"'

complete -C /usr/local/bin/vault vault

function show_args() {
    local i=1
    local reset="$(echo -en "\033[0m")"
    local gray="$(echo -en "\033[90m")"
    local green="$(echo -en "\033[92m")"
    for arg in "$@"
    do
        echo "$gray\$$i:$reset $green$arg$reset"
        (( i++ ))
    done
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
