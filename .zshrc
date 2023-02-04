
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp)

# Aliases
alias vim="$(which nvim)"
alias ls="$(which exa)"
alias tree="$(which exa) --tree"

alias k="kubectl"
alias dps="docker ps"
alias gst="$(which git) status"
alias dcompose=docker-compose

# Exports
export NCONF="$HOME/.config/nvim/"
export NEOVIM_BIN="$(which nvim)"

# Go
GOVER=1.18beta1
#GOVER=1.17
export GOROOT="$HOME/.asdf/installs/golang/$GOVER/go"
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"

# alias rm="$(which trash)"

# BASE16_SHELL=$HOME/.config/base16-shell/
# [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

WORKSPACE="$HOME/work"

YARN_BIN="$HOME/.yarn/bin"
YARN_MODULES="$HOME/.config/yarn/global/node_modules/.bin"
LOCAL_BIN="$HOME/.local/bin"

export PATH="$YARN_BIN:$YARN_MODULES:$LOCAL_BIN:$PATH:$GOBIN"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND='rg --files'

export CFLAGS="-I$(brew --prefix openssl)/include"
export LDFLAGS="-L$(brew --prefix openssl)/lib"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# helper to draw graphs with graphviz
alias pygraph='find . -iname "*.py" | xargs pyan --dot --colored --no-defines --grouped | dot -Tpng -Granksep=1.5 | open -f -a /Applications/Preview.app'

export PATH="/Users/nopestack/.deno/bin:$PATH"

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

export PATH="/usr/local/sbin:$PATH"

export JAVA_HOME="/usr/local/Cellar/openjdk@11/11.0.10"

bindkey -s ^f "tmux-sessionizer\n"

alias cargofix="cargo clippy --fix --allow-dirty --allow-staged"
alias cargofmt="cargo fmt"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda deactivate

