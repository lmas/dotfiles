
alias grep="grep --color=auto"
alias ls="ls -F --color=auto"
alias ll="ls -lh"
alias la="ls -Alh"
alias rm="rm -I"
alias mplayer="mplayer -fs -nolirc"

# SSH
# create new key. supply a filename (the '-f') to store it in!
alias sshnewkey="ssh-keygen -t dsa -C '' -f"

# download youtube videos
alias yt_to_mp3='echo "Enter URLS:" && youtube-dl --extract-audio --output "%(title)s.%(ext)s" --restrict-filenames --audio-format mp3 --add-metadata --batch-file -'

# Encrypt/decrypt files
alias enc='openssl aes-192-cbc -salt -e'
alias dec='openssl aes-192-cbc -salt -d'

# Mount network drive via sshfs
alias boxmount="sshfs -p 8822 -o IdentityFile=~/.ssh/files debian-transmission@thebox:/files/ /files/"
