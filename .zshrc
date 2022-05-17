
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nopestack/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=7
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
    git
    zsh-autosuggestions
    fast-syntax-highlighting
    zsh-completions
)

fpath+=~/.zfunc
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"


ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp)

# Aliases
alias vim="$(which nvim)"

alias k="kubectl"
alias dps="docker ps"
alias gst="$(which git) status"
#alias code="$(which code-insiders)"

alias dcompose=docker-compose

# Exports
export NCONF="$HOME/.config/nvim/"

# Go
GOVER=1.18beta1
#GOVER=1.17
export GOROOT="$HOME/.asdf/installs/golang/$GOVER/go"
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"

# alias rm="$(which trash)"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

. $HOME/.asdf/asdf.sh

#. $HOME/.asdf/completions/asdf.bash

WORKSPACE="$HOME/Workspace"

# Disabled per iTerm
# Source https://jdhao.github.io/2018/10/19/tmux_nvim_true_color/
#export TERM=xterm-256color


#export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
#export PATH="/usr/local/sbin:$PATH"

YARN_BIN="$HOME/.yarn/bin"
YARN_MODULES="$HOME/.config/yarn/global/node_modules/.bin"
LOCAL_BIN="$HOME/.local/bin"
PYENV_BIN="$PYENV_ROOT/bin"

export PATH="$YARN_BIN:$YARN_MODULES:$LOCAL_BIN:$PYENV_BIN:$PATH:$GOBIN"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND='rg --files'

export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# helper to draw graphs with graphviz
alias pygraph='find . -iname "*.py" | xargs pyan --dot --colored --no-defines --grouped | dot -Tpng -Granksep=1.5 | open -f -a /Applications/Preview.app'

# Wasmer
export WASMER_DIR="/Users/nopestack/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

eval "$(pyenv init -)"

export PATH="$HOME/.poetry/bin:$PATH"

export PATH="/Users/nopestack/.deno/bin:$PATH"

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

export PATH="/usr/local/sbin:$PATH"
#
#export PATH="/usr/local/opt/sqlite/bin:$PATH"
export JAVA_HOME="/usr/local/Cellar/openjdk@11/11.0.10"
export PATH="$PATH:/Users/nopestack/Library/Application Support/Coursier/bin"
[ -f "/Users/nopestack/.ghcup/env" ] && source "/Users/nopestack/.ghcup/env" # ghcup-env
export PATH="/var/folders/sk/tky7ly1s1l9cr5q13pdg5y1h0000gn/T/fnm_multishells/28149_1638569498914/bin":$PATH 

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

bindkey -s ^f "tmux-sessionizer\n"
