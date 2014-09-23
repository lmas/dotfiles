
# Add user dirs to PATH
if [ -d "$HOME/.bin" ] ; then
        export PATH=$HOME/.bin:$HOME/.local/bin:$PATH
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

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion

    # Add python pip commands
    _pip_completion()
    {
        COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                       COMP_CWORD=$COMP_CWORD \
                       PIP_AUTO_COMPLETE=1 $1 ) )
    }
    complete -o default -F _pip_completion pip
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
