# ===============================================================
# POWERLEVEL10K INSTANT PROMPT (must be first)
# ===============================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ===============================================================
# ENVIRONMENT VARIABLES
# ===============================================================
export PATH="$PATH:$HOME/.local/bin"
export EDITOR="vim"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# ===============================================================
# HISTORY
# ===============================================================
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory sharehistory
setopt hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# ===============================================================
# ZINIT
# ===============================================================
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# ===============================================================
# PROMPT
# ===============================================================
zinit ice depth=1; zinit light romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===============================================================
# COMPLETION STYLING (before compinit)
# ===============================================================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# ===============================================================
# PLUGINS
# ===============================================================

# Completions first (needed before compinit)
zinit light zsh-users/zsh-completions

# OMZ snippets (lazy load)
zinit ice wait lucid; zinit snippet OMZP::git
zinit ice wait lucid; zinit snippet OMZP::sudo
zinit ice wait lucid; zinit snippet OMZP::command-not-found
zinit ice wait lucid; zinit snippet OMZP::aliases

# ZSH plugins (lazy load)
zinit ice wait lucid; zinit light Aloxaf/fzf-tab
zinit ice wait lucid; zinit light zsh-users/zsh-autosuggestions
zinit ice wait lucid; zinit light akash329d/zsh-alias-finder

# Syntax highlighting last (lazy load)
zinit ice wait lucid; zinit light zdharma-continuum/fast-syntax-highlighting

# ===============================================================
# COMPLETIONS (
# ===============================================================
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
	compinit # Rebuild if cache is older than 24 hours
else
	compinit -C # Use cache
fi

# ===============================================================
# KEY BINDINGS
# ===============================================================
bindkey -v
bindkey -M viins "jk" vi-cmd-mode
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ===============================================================
# ALIASES
# ===============================================================
command -v batcat &>/dev/null && alias bat="batcat"
command -v nvim   &>/dev/null && alias v="nvim"
alias cls="clear"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias fix_zsh='cd ~ && mv .zsh_history .zsh_history_bad && strings .zsh_history_bad > .zsh_history && fc -R .zsh_history && rm .zsh_history_bad'
if command -v lsd &>/dev/null; then
	alias l="lsd -lah"
else
	alias l="grc ls -slah --color"
fi

# ===============================================================
# FUNCTIONS
# ===============================================================
update() {
	if command -v apt &>/dev/null; then
		sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y
	fi
	command -v flatpak &>/dev/null && flatpak update -y
}

# ===============================================================
# SHELL INTEGRATIONS
# ===============================================================
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# ===============================================================
# LOCAL OVERRIDES (machine-specific, keep last)
# ===============================================================
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

