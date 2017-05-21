export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

setopt AUTO_CD
setopt AUTO_PUSHD
setopt correct
setopt list_packed 
setopt nolistbeep 
setopt EXTENDED_HISTORY
setopt HIST_EXPAND
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt transient_rprompt

bindkey -e

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

autoload -U compinit
compinit

## history
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 50
zstyle ':completion:*' list-colors ''
zstyle :compinstall filename "$HOME/.zshrc"

alias ll="ls -l"
alias la="ls -a"
alias h="hub"
alias gi="git init"
alias gd="git diff"
alias gss="git status --short"
alias gg="git grep"
alias t="git grep"
alias reload="source ~/.zshrc;source ~/.zshenv"
alias zshrc="vim ~/.zshrc"
alias zshenv="vim ~/.zshenv"
alias dotfiles="cd ~/dotfiles"

# Env
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export VISUAL="vim"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function ghq-cd(){
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$seleced_dir" ]; then
        BUFER="cd ${selected_dir}"
    fi
}

zle -N ghq-cd


function peco-emacs(){
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    
    if [ -n "$seleced_dir" ]; then
        BUFER="emacs ${selected_dir}"
    fi
}

zle -N peco-emacs

export HOMEBREW_GITHUB_API_TOKEN=2a94d1a1cd5efabd02d0a9a12559e1d002714311

export GOPATH=$HOME/.go

export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/bin
export EDITOR='emacsclient'
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cask/bin
export PATH=$PATH:$HOME/.cargo/bin


typeset -U PATH



export PGDATA=/usr/local/var/postgres




function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

