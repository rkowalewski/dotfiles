typeset -U path

path+=("$HOME/bin")

# prepend texlive with linux installation
path=("/usr/local/texlive/current/bin/x86_64-linux" $path)
MANPATH="/usr/local/texlive/current/texmf-dist/doc/man:$MANPATH"
INFOPATH="/usr/local/texlive/current/texmf-dist/doc/info:$INFOPATH"

path=("/usr/local/go/bin" "$HOME/go/bin" $path)

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
path+=("$HOME/.cabal/bin")
path+=("$HOME/go/bin")

[[ -f "$HOME/.zshenv.local" ]] && source $HOME/.zshenv.local

# add only those paths which really exist and finally export it
path=($^path(N))
export PATH

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}

