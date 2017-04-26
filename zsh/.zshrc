# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/kowalewski/.oh-my-zsh

export DOTFILES=$HOME/.dotfiles
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="babun"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES/zsh/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast colored-man-pages colorize common-aliases tmux zsh-256color git-prompt ssh-agent zsh_reload)
##


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# source all files from custom zsh aliases


export ZSH_DIRCOLORS_SOLARIZED_DIR=${DOTFILES}/external/dircolors-solarized

for file in $DOTFILES/zsh/aliases/**/*(.); source $file

#----------------SOLARIZED---------------------------------------------------
function switch_solarized {

  # This is only a hack as we can safely transmit LC_* variables in many SSH
  # Servers. Then we can set the vim theme accordingly
  export LC_SOLARIZED_THEME="${1:-dark}"

  if [[ "$(uname)" =~ CYGWIN_NT.* ]];
  then
    local solarized_path="$DOTFILES/external/mintty-colors-solarized"

    if [[ "$LC_SOLARIZED_THEME" == "dark" ]]; then
      source "$solarized_path/mintty-solarized-dark.sh"
    else
      source "$solarized_path/mintty-solarized-light.sh"
    fi
  elif [[ "$(uname -sr)" =~ ^Linux.*Microsoft$ ]]; then
    # We are in Bash On Windows
  elif [[ "$(uname)" =~ *Darwin* ]]; then
    # We are in MacOS
  elif [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    # We are in a ssh session...
  fi
}

function setup_solarized {
  if [[ -n "$LC_COLORSCHEME" ]]; then
    return 0
  fi

  dynamic-colors init

  export LC_COLORSCHEME=`cat $DOTFILES/external/dynamic-colors/colorscheme`

 # local hour="$(date +"%H")"
 # if [[ $hour -ge 18 ]] || [[ $hour -lt 7 ]]; then
 #   switch_solarized "dark"
 # else
 #   switch_solarized "light"
 # fi
}

setup_solarized

eval `dircolors $DOTFILES/external/dircolors-solarized/dircolors.256dark`

#if [[ "$LC_SOLARIZED_THEME" == "dark" ]]; then
#  setup_solarized_dircolors dircolors.ansi-dark
#else
#  setup_solarized_dircolors dircolors.ansi-light
#fi

#----------------------------------------------------------------------------------

alias tmux='tmux -2'
# do not share history between tmux windows
unsetopt share_history

# Bind Ctrl-U to backward-kill-line instead of the whole line
bindkey \^U backward-kill-line

# load local settings
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

