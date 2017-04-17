#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start dwm/X11 when we log in
if [[ "$(tty)" == "/dev/tty1" ]]; then
    if ps ax | grep -v grep | grep -q /usr/bin/X; then
            echo "X is running."
    else
            ssh-agent startx >/dev/null 2>&1
    fi
fi
