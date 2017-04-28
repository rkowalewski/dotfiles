typeset -U path

echo "$PATH"
export VANILLA_PATH=$PATH

path+="$HOME/bin"
path+='/usr/local/bin'

# prepend path
path=('/opt/openmpi/2.1.0/bin' $path)

# append path
path=('/opt/tmux/2.3/bin' $path)

#dynamic colors
export DYNAMIC_COLORS_ROOT=$HOME/.dotfiles/external/dynamic-colors
path=("$HOME/.dotfiles/external/dynamic-colors/bin" $path)

# add only those paths which really exist and finally export it
path=($^path(N))
export PATH

