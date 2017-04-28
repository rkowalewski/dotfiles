typeset -U path

path+="$HOME/bin"
path+='/usr/local/bin'

# prepend path
path=('/opt/openmpi/2.1.0/bin' $path)

# append path
path=('/opt/tmux/2.3/bin' $path)

#dynamic colors
[[ -z "$DYNAMIC_COLORS_ROOT" ]] && DYNAMIC_COLORS_ROOT=$HOME/.dotfiles/external/dynamic-colors

path=("$DYNAMIC_COLORS_ROOT/bin" $path)

# add only those paths which really exist and finally export it
path=($^path(N))
export PATH

