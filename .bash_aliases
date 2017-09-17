
alias grep="grep --color=auto"
alias ls="ls -F --color=auto --time-style=+'%Y-%m-%d %H:%M'"
alias ll="ls -lh"
alias la="ls -Alh"
alias rm="rm -I"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias mplayer="mplayer -fs -nolirc"
alias music='ncmpc -h 192.168.2.1'

# create new key. supply a filename (the '-f') to store it in!
alias newkey="ssh-keygen -t ed25519 -f"
alias addkey="ssh-add -t 4w"

# download youtube videos
alias yt_to_mp3='echo "Enter URLS:" && youtube-dl --extract-audio --output "%(title)s.%(ext)s" --restrict-filenames --audio-format mp3 --add-metadata --sleep-interval 2 --batch-file - '

# Grab stream url of a youtube video
alias yt_url='youtube-dl --prefer-insecure -g -f140 - '

alias banner="figlet -f mono12.tlf -o"

alias fixwifi="sudo connmanctl scan wifi"

alias peanut="sudo netstat -peanut"

alias gsta='git status'
alias gcom='git commit'
alias gcam='git commit --amend'
alias gadd='git add'
alias glog='git log --pretty=minimal'
alias gdif='git diff'
alias gdic='git diff --cached'
alias gsho='git show'
alias gche='git checkout'
alias gpul='git pull'
alias gpus='git push'
