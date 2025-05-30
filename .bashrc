#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Prompt
PS1='[\[\e[4;32m\]\t\[\e[0m\] \[\e[4;31m\]\u\e[0m\]@\e[33m\]\h\[\e[0m\] \W] \[\e[33m\]$?\[\e[0m\] \$ '
PS2='>'
# ---------------------------------------------------------
# fzf integration
# if [[ $(which fzf) == 0 ]]; then
#     source <(fzf --bash)
# fi

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
 else
   export EDITOR='nvim'
fi
# Custom variables
# User variables

export HOME="/home/$USER"           # home directory
export HOME_CONFIG="$HOME/.config"  # .config directory
export HOME_LOCAL="$HOME/.local"    # .local directory
export HOME_BIN="$HOME/.bin"        # .bin directory(i use it to store some binaries)
# Other variables
export NVIM_CONFIG="$HOME_CONFIG/nvim"                             # neovim config directory
export NVIM_MASON_BIN="$HOME_LOCAL/share/nvim/mason/bin"           # neovim mason binaries
export CARGO_BIN="$HOME/.cargo/bin"                                # cargo binaries
export CARGO_ENV="$HOME/.cargo/env"                                # cargo envirioment
# PATH
export PATH="$PATH:$HOME_BIN:$NVIM_MASON_BIN:$CARGO_BIN:$CARGO_ENV"
export PATH="$PATH:$HOME_LOCAL/bin:$HOME_BIN/go/bin:$HOME_BIN/lua-5.4.7/src:$HOME_BIN/node-v22.14.0/bin"
export PATH="$PATH:$HOME/Code/3rd/arduino-cli"
#Functions

function md(){
    mkdir -p $1
    cd $1
}

# Aliases

alias conf-bash="$EDITOR $HOME/.bashrc" # easy configure bash command
alias bashrc="source $HOME/.bashrc"     # easy reload bash config

alias grep='grep --color=auto'
alias mkdir="mkdir -p"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -al --color=auto"
alias nv="nvim"
. "$HOME/.cargo/env"
