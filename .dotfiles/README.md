
# Setup

Copy this repo to `/home/lmas/.dotfiles/` and add shell alias:

    alias dotfiles 'git --git-dir=/home/lmas/.dotfiles/ --work-tree=/home/lmas'

Then apply the config files:

    dotfiles reset --hard

# List all tracked files

    git ls-tree --full-tree -r --name-only HEAD
