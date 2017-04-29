typeset -U path

path+="$HOME/bin"
path+='/usr/local/bin'

# prepend path
path=('/opt/openmpi/2.1.0/bin' $path)

path=('/opt/tmux/bin' $path)
# append path

#dynamic colors
[ -z "${DYNAMIC_COLORS_ROOT}" ] && DYNAMIC_COLORS_ROOT=$HOME/.dotfiles/external/dynamic-colors

export DYNAMIC_COLORS_ROOT

path=("$DYNAMIC_COLORS_ROOT/bin" $path)

# add only those paths which really exist and finally export it
path=($^path(N))
export PATH

[[ -f "$HOME/.zshenv.local" ]] && source $HOME/.zshenv.local
