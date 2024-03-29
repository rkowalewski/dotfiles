# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#
export ZSH=$HOME/.oh-my-zsh

export DOTFILES=$HOME/.dotfiles
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

if [[ `uname` =~ ^CYGWIN_NT ]]; then
    # Async pure theme not supported on windows
    # see https://github.com/sindresorhus/pure/issues/198
    ZSH_THEME="babun"
else
    PURE_PROMPT_SYMBOL="λ"
    ZSH_THEME="pure"
fi

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

export FZF_BASE="${HOME}/.fzf"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git gitfast solarized-man colorize common-aliases tmux ripgrep ssh-agent fzf vi-mode)
##


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Load Supercomputing Environment Modules
if [[ -f "/etc/profile.d/modules.sh" ]]; then
    source /etc/profile.d/modules.sh

    if [[ -n "$(module avail |& grep -o git)" ]]; then
        # Load git if available
        module load git
    fi
fi

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

if [[ -x "$(command -v nvim)" && ! `uname` =~ ^CYGWIN_NT ]]
then
    export EDITOR=nvim
else
    export EDITOR=vim
fi


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


#[[ -z "${SSH_CONNECTION}"  && -z "${TMUX}" \
#    && -n "$(type dynamic-colors)" ]] && dynamic-colors init

#eval `dircolors $DOTFILES/external/dircolors-solarized/dircolors.ansi-dark`
eval `dircolors $DOTFILES/external/nord-dircolors/src/dir_colors`

#----------------------------------------------------------------------------------

alias tmux='tmux -2'
# do not share history between tmux windows / panes

# unsetopt share_history
setopt hist_ignore_all_dups

if [[ ! `uname` =~ ^CYGWIN_NT ]] && type nvim > /dev/null 2>&1; then
    alias vim='nvim'
fi

# Bind Ctrl-U to backward-kill-line instead of the whole line
bindkey \^U backward-kill-line

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# source all files from custom zsh aliases
for file in $DOTFILES/zsh/scripts/**/*;
do
    source $file
done

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

# load local settings
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS,build} --exclude=tags'

# see https://github.com/ohmyzsh/ohmyzsh/issues/1720#issuecomment-286366959
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi


