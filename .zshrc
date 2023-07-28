# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions F-Sy-H)

source $ZSH/oh-my-zsh.sh

# User configuration

# fpath+=~/.zfunc

# setopt autocd
#
# # autoload -U compinit && compinit
# autoload -Uz compinit 
# if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
# 	compinit;
#     touch ~/.zcompdump
# else
# 	compinit -C;
# fi;

function take {
    mkdir -p $1
    cd $1
}

# force emacs mode on shell
# TODO: figure how to make vim mode play nice with ^f
bindkey -e

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
if uname -a | grep -q "arm64"; then
    # Apple Silicon
  export ARCHFLAGS="-arch arm64"
else
    # Intel
  export ARCHFLAGS="-arch x86_64"
fi
# Aliases
alias vim="$(which nvim)"
alias ls="$(which exa)"
alias lsa="$(which exa) -lah"
alias tree="$(which exa) --tree"
alias ga="$(which git) add"
alias gc="$(which git) commit"
alias gst="$(which git) status"
alias cx="$(which exa) $1 && cd $1"
alias pclean="$(which podman) container rm --all -v"
alias nerd="$(which nerdctl)"
alias tf="$(which terraform)"

# [f]ind [w]ith fzf
alias fw="fzf --preview 'bat --color \"always\" {}'"
alias cargofix="cargo clippy --fix --allow-dirty --allow-staged"
alias cargofmt="cargo fmt"
alias docker="podman"
alias dps="docker ps"
alias \$=''
alias rm="$(which trash)"
alias k="kubectl"

# autocd into previous directory
alias -- -="cd -"

# Exports
export NCONF="$HOME/.config/nvim/"
export NEOVIM_BIN="$(which nvim)"

LOCAL_BIN="$HOME/.local/bin"
SBIN="/usr/local/sbin"

export PATH="$SBIN:$LOCAL_BIN:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ "$TERM_PROGRAM" = tmux ]; then
   bindkey -s ^f "tmux-sessionizer\n"
fi

load_kubectl_env() {
    [[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
}

load_conda_env() {
    export CONDA_DEFAULT_ENV="base"

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
            . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
        else
            export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
    
    conda deactivate
}

load_plugins_env() {
    load_kubectl_env
    echo "loaded kubectl"
    load_conda_env
    echo "loaded conda env"
}
