#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

# wrapper for the `find` command
f() {
    dir=$1
    shift
    phrase=$@
    find ${dir} -name "${phrase}"
}

# Append stuff to PATH
export PATH="$HOME/scripts:$PATH"
. "$HOME/.cargo/env"
