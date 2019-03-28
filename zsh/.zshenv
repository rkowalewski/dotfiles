typeset -U path

path+=("$HOME/bin")

# prepend texlive with linux installation
path=("/usr/local/texlive/current/bin/x86_64-linux" $path)

# prepend local binaries in path
path=("$HOME/opt/bin" $path)

# Everyting in /opt
path+=("/opt/universal-ctags/bin")

# Rust
path+=("$HOME/.cargo/bin")

# Other local stuff
path+=("$HOME/.local/bin")
path+=("$HOME/.npm_modules/bin")
path+=("$HOME/.fzf/bin")


# add only those paths which really exist and finally export it
path=($^path(N))
export PATH

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

[[ -f "$HOME/.zshenv.local" ]] && source $HOME/.zshenv.local
