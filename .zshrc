fpath+=~/.zfunc

setopt autocd

# autoload -U compinit && compinit
autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
    touch ~/.zcompdump
else
	compinit -C;
fi;

function take {
    mkdir -p $1
    cd $1
}

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fsh/F-Sy-H.plugin.zsh

# force emacs mode on shell
# TODO: figure how to make vim mode play nice with ^f
bindkey -e

eval "$(starship init zsh)"

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

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp)

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
DENO_BIN="$HOME/.deno/bin"

export PATH="$SBIN:$DENO_BIN:$LOCAL_BIN:$PATH"

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

load_rancher_env() {
    ### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
    export PATH="/Users/nopestack/.rd/bin:$PATH"
    ### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
}

load_plugins_env() {
    load_kubectl_env
    echo "loaded kubectl"
    load_conda_env
    echo "loaded conda env"
    load_rancher_env
    echo "loaded rancher env"
}

