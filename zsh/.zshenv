typeset -U path

path+=("$HOME/bin")

# texlive
path+=('/usr/local/texlive/current/bin/x86_64-linux')

# Rust
path+=("$HOME/.cargo/bin")

# Other local stuff
path+=("$HOME/.local/bin")

# Other local stuff
path+=("$HOME/.npm_modules/bin")

# append path
path+=("$HOME/opt/bin")

path+=("$HOME/.fzf/bin")

path+=("/opt/universal-ctags/bin")

# add only those paths which really exist and finally export it
path=($^path(N))
export PATH

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

[[ -f "$HOME/.zshenv.local" ]] && source $HOME/.zshenv.local
