typeset -U path

path+="$HOME/bin"
path+='/usr/local/bin'

# texlive
path+='/usr/local/texlive/current/bin/x86_64-linux'

# Rust
path+="$HOME/.cargo/bin"

# Other local stuff
path+="$HOME/.local/bin"

# Other local stuff
path+="$HOME/.npm_modules/bin"

# append path
path=("$HOME/opt/bin" $path)

#dynamic colors
[ -z "${DYNAMIC_COLORS_ROOT}" ] && DYNAMIC_COLORS_ROOT=$HOME/.dotfiles/external/dynamic-colors

export DYNAMIC_COLORS_ROOT

path=("$DYNAMIC_COLORS_ROOT/bin" $path)

path=("$HOME/opt/bin" $path)

path=("$HOME/.cargo/bin" $path)
path=("$HOME/.fzf/bin" $path)

# add only those paths which really exist and finally export it
path=($^path(N))
export PATH

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

[[ -f "$HOME/.zshenv.local" ]] && source $HOME/.zshenv.local
