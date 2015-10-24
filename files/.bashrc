
# Add user dirs to PATH
if [ -d "$HOME/.local/.bin" ] ; then
    export PATH=$HOME/.local/.bin:$PATH
fi

if [ -d "$HOME/.bin" ] ; then
    export PATH=$HOME/.bin:$PATH
fi

# Settings for Go
export GOROOT=$HOME/.gobin
export GOPATH=$HOME/.go
if [ -d "$GOPATH" ] ; then
    export PATH=$GOPATH/bin:$PATH
fi
if [ -d "$GOROOT" ] ; then
    export PATH=$GOROOT/bin:$PATH
fi


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Ignore dulicate lines and lines starting with a space
HISTCONTROL=ignoreboth

# Append, only, to the history file
shopt -s histappend

# Set history length and size
HISTSIZE=1000
HISTFILESIZE=2000

# Set the terminal prompt
PS1='\[\e[1;32m\]\u\[\e[m\]@\h:\[\e[1;34m\]\w\[\e[m\] $ '

export EDITOR=/usr/bin/vim

# enforce encoding
export LC_ALL="$LANG"

# Load system wide completions
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Load user completion
if [ -d ~/.bash_completion.d ]; then
    for file in ~/.bash_completion.d/*; do
        source "$file"
    done
fi

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Base16 Shell
BASE16_SHELL="$HOME/.base16-monokai.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# virtualenvwrapper for python
export WORKON_HOME=~/.venvs
export PROJECT_HOME=~/projects
source ~/.local/bin/virtualenvwrapper.sh
