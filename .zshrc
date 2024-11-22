# ZINIT Config & Plugins
# zinit plugin manager install
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git" # zinit directory
if [[ ! -d $ZINIT_HOME ]]; then                                            # check if zinit is installed
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh" # source zinit

# zinit plugins
# Theme [OH-MY-ZSH]
zi snippet OMZL::git.zsh
zi snippet OMZP::git             # Oh-My-ZSH compatibility
zi cdclear -q

setopt promptsubst               # prompt substitution option

zi snippet OMZT::agnoster # theme : agnoster
# Plugins

zinit light zsh-users/zsh-syntax-highlighting # Highlighting
zinit light zsh-users/zsh-autosuggestions     # fish/nu style auto suggestions 
zinit light zsh-users/zsh-completions         # auto completions

autoload -U compinit && compinit # load completions

# ZSH Config

# History
HISTSIZE=1000
HISTFILE="/${XDG_DATA_HOME:-${HOME}}/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
HIST_STAMPS="dd.mm.yyyy"                        # "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# USER CONFIG

# Default editor

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
 else
   export EDITOR='nvim'
fi

# Custom variables
# User variables
export USER="jay"                   # my username

export HOME="/home/$USER"           # home directory
export HOME_CONFIG="$HOME/.config"  # .config directory
export HOME_LOCAL="$HOME/.local"    # .local directory
export HOME_BIN="$HOME/.bin"        # .bin directory(i use it to store binaries I made or downloaded)
# Other variables
export NVIM_CONFIG="$HOME_CONFIG/nvim"                             # neovim config directory
export NVIM_MASON_BIN="$HOME_LOCAL/share/nvim/mason/bin"           # neovim mason binaries
export CARGO_BIN="$HOME/.cargo/bin"                                # cargo binaries
export CARGO_ENV="$HOME/.cargo/env"                                # cargo envirioment
# PATH
export PATH="$PATH:$HOME_BIN:$NVIM_MASON_BIN:$CARGO_BIN:$CARGO_ENV:$HOME_LOCAL/bin"

# tools integrations
source <(fzf --zsh)
eval "$(zoxide init zsh)"

# Functions
md(){
    mkdir -p $1
    cd $1
}
# Aliases
alias conf-zsh="$EDITOR $HOME/.zshrc" # easy configure zsh command
alias zshrc="source $HOME/.zshrc"     # easy reload zsh config

alias grep='grep --color=auto'
alias mkdir="mkdir -p"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -al --color=auto"

alias nv="nvim"
