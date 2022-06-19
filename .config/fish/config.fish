
if status --is-login
        set -gx GOPATH "$HOME/.go"
        if test -d "$GOPATH/bin"
                set -gx PATH $PATH $GOPATH/bin
        end

        set -gx EDITOR /usr/local/bin/nvim
        set -gx PAGER /usr/bin/less
        set -gx LC_ALL $LANG
        set -gx XDG_RUNTIME_DIR /tmp/xdgruntime

	# Force faster shell for sxhkd (fix problems and performance)
	set -gx SXHKD_SHELL sh

	# If no X server, will kick out the user when trying to login
	exec ssh-agent startx >/dev/null 2>&1

else if status --is-interactive
        # Set vi mode
        set -g fish_key_bindings fish_vi_key_bindings

        # Shell colors
        eval sh "$__fish_config_dir/base16-gruvbox.sh"

        alias vim       "nvim"
        alias grep      "grep --color=auto"
        alias ls        "ls -F --color=auto -D \"%Y-%m-%d %H:%M\"" #--group-directories-first"
        alias ll        "ls -lh"
        alias la        "ls -Alh"
        alias rm        "rm -I"
        alias du        "du -h"
        alias df        "df -h"
        alias gsta      "git status"
        alias gcom      "git commit"
        alias gcam      "git commit --amend"
        alias gadd      "git add"
        alias glog      "git log --pretty=minimal"
        alias gdif      "git diff"
        alias gdic      "git diff --cached"
        alias gsho      "git show"
        alias gche      "git checkout"
        alias gpul      "git pull"
        alias gpus      "git push"

        alias dotfiles  "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
        alias peanut    "sudo netstat -peanut"

        # create new key. supply a filename (the "-f") to store it in!
        alias newkey    "ssh-keygen -t ed25519 -f"
        alias addkey    "ssh-add -t 4w"

        # download youtube videos
        alias yt_to_mp3 "echo \"Enter URLS:\" && youtube-dl --extract-audio --output \"%(title)s.%(ext)s\" --restrict-filenames --audio-format mp3 --add-metadata --sleep-interval 9 --batch-file - "
        # Grab stream url of a youtube video
        alias yt_url    "youtube-dl --prefer-insecure -g -f140 - "
end

# Fix weird issue with FreeBSD, symlinking /home to /usr/home and prompt_pwd not shortening home path to ~
cd

####################################################################################################
# Special fish functions

function on_exit --on-event fish_exit
        clear
end

function fish_greeting
        # Disabled
end

function fish_title
        echo (prompt_pwd) - (status current-command)
end

function fish_mode_prompt
        # Disabled
end

function fish_prompt
        set -l last_status $status

        set_color $fish_color_user
        echo -n "$USER"
        set_color normal
        echo -n "@"
        if test -z $SSH_CONNECTION
                set_color $fish_color_host
        else
                set_color $fish_color_host_remote
        end
        echo -n "$hostname "

        set_color $fish_color_cwd
        echo -n (prompt_pwd)

        if test "$fish_key_bindings" = "fish_vi_key_bindings"
                switch $fish_bind_mode
                case default
                        set_color --background $fish_color_error normal
                        echo -n " N "
                case visual
                        set_color --background $fish_color_command normal
                        echo -n " V "
                case replace_one
                        set_color --background $fish_color_quote normal
                        echo -n " R "
                #case insert
                        #set_color --background $fish_color_quote normal
                        #echo -n " I "
                end
        end

        set_color normal
        if test $last_status -ne 0
                set_color --background $fish_color_error normal
        end
        echo -n " # "
        set_color normal
end

function fish_right_prompt
        set_color --background normal $fish_color_autosuggestion
        set -l seconds (math --scale=0 "$CMD_DURATION / 1000")
        set -l minutes (math --scale=0 "$seconds / 60")
        set -l hours (math --scale=0 "$minutes / 60")
        if test $hours -gt 1
                echo -n -s $hours h
        else if test $minutes -gt 1
                echo -n -s $minutes m
        else if test $seconds -gt 0
                echo -n -s $seconds s
        else
                echo -n -s $CMD_DURATION ms
        end

        set -l git_branch (command git symbolic-ref --short HEAD 2> /dev/null)
        if test -n (echo $git_branch)

                set -l git_dirty (echo (command git status --porcelain --ignore-submodules=dirty 2> /dev/null | wc -l))
                if test $git_dirty -ne 0
                        set_color --background $fish_color_error normal
                        echo -n " * "
                end

                set -l git_upstream (echo (command git rev-list --count --left-right origin/"$git_branch"...HEAD 2> /dev/null))
                switch $git_upstream
                case ""         # No upstream
                        set_color --background $fish_color_error normal
                        echo -n " ⨯ "
                case "0	0"      # Equal to upstream
                        set_color --background normal $fish_color_autosuggestion
                        echo -n " = "
                case "0	*"      # Ahead
                        set_color --background $fish_color_quote normal
                        echo -n " ↑ "
                case "*	0"      # Behind
                        set_color --background $fish_color_quote normal
                        echo -n " ↓ "
                case "*"        # Diverged
                        set_color --background $fish_color_error normal
                        echo -n " ⥄ "
                end

                set_color --background normal $fish_color_autosuggestion
                echo -n "$git_branch"
        end

        echo -n "" (date "+%H:%M") # "" adds an extra space (padding to either the time or git output)
        set_color normal
end
