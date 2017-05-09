typeset -U path

typeset -U manpath

path+="$HOME/bin"
path+='/usr/local/bin'

# prepend path
path=('/opt/openmpi/2.1.0/bin' $path)

path=('/opt/tmux/bin' $path)

# VIM
path=('/opt/vim/bin' $path)

# append path
path=("$HOME/opt/bin" $path)

#dynamic colors
[ -z "${DYNAMIC_COLORS_ROOT}" ] && DYNAMIC_COLORS_ROOT=$HOME/.dotfiles/external/dynamic-colors

export DYNAMIC_COLORS_ROOT

path=("$DYNAMIC_COLORS_ROOT/bin" $path)

# add only those paths which really exist and finally export it
path=($^path(N))
export PATH

manpath+=$HOME/opt/stdman/share/man
typeset -U manpath

[[ -f "$HOME/.zshenv.local" ]] && source $HOME/.zshenv.local
