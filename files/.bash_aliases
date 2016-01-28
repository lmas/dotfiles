
alias grep="grep --color=auto"
alias ls="ls -F --color=auto"
alias ll="ls -lh"
alias la="ls -Alh"
alias rm="rm -I"
alias mplayer="mplayer -fs -nolirc"
alias music='ncmpc -h 192.168.2.1'

# create new key. supply a filename (the '-f') to store it in!
alias sshnewkey="ssh-keygen -t dsa -C '' -f"

# download youtube videos
alias yt_to_mp3='echo "Enter URLS:" && youtube-dl --extract-audio --output "%(title)s.%(ext)s" --restrict-filenames --audio-format mp3 --add-metadata --sleep-interval 2 --batch-file - '

# Grab stream url of a youtube video
alias yt_url='youtube-dl --prefer-insecure -g -f140 - '

# Encrypt/decrypt files
alias enc='openssl aes-192-cbc -salt -e'
alias dec='openssl aes-192-cbc -salt -d'

# Mount network drive via sshfs
alias boxmount="sshfs -p 8822 -o IdentityFile=~/.ssh/files debian-transmission@thebox:/files/ /files/"

alias banner="figlet -f mono12.tlf -o"

alias g='git'
alias gsta='git status'
alias gcom='git commit'
alias gadd='git add'
alias glog='git log --pretty=minimal'
alias gdif='git diff'
alias gdic='git diff --cached'
alias gsho='git show'
alias gche='git checkout'
alias gres='git reset --hard'
alias gpul='git pull'
alias gpus='git push'
