
eval "$(/opt/homebrew/bin/brew shellenv)"

# Supress fish's intro message
set fish_greeting

# Prompt

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
# alias nerd="$(which nerdctl)"
alias tf="$(which terraform)"
alias take="mkdir $1 && cd $1"
 
# [f]ind [w]ith fzf
alias fw="fzf --preview 'bat --color \"always\" {}'"
# alias cargofix="cargo clippy --fix --allow-dirty --allow-staged"
# alias cargofmt="cargo fmt"
# alias docker="podman"
alias dps="$(which docker) ps"
alias rm="$(which trash)"
# alias \$=""
# autocd into previous directory
# alias -="cd -"

# Exports
set -gx EDITOR "nvim"
set -gx NCONF "$HOME/.config/nvim/"
set -gx NEOVIM_BIN "$(which nvim)"

set LOCAL_BIN "$HOME/.local/bin"
set LOCAL_SBIN "/usr/local/sbin"
# set DENO_BIN "$HOME/.deno/bin"

set --export --prepend PATH $LOCAL_BIN 
#set -gx PATH "$SBIN:$DENO_BIN:$LOCAL_BIN:$PATH"

if [ "$TERM_PROGRAM" = tmux ]
   bind \cf tmux-sessionizer
end

alias k="$(which kubectl)"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
set -gx MAMBA_EXE "/opt/homebrew/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/Users/nopestack/.micromamba"
$MAMBA_EXE shell hook --shell fish --prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

alias mamba="$(which micromamba)"
