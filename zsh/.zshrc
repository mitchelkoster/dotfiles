# Env variables
export PATH="$PATH:$HOME/.local/bin"
export EDITOR="vim"

# Aliases
alias sail="bash vendor/bin/sail"
alias l="grc ls -slah --color"
alias ..="cd ../"
alias update="sudo apt update -y; sudo apt upgrade -y; sudo apt dist-upgrade -y; sudo apt autoclean -y; sudo apt auto-remove -y"
alias fix_zsh="mv .zsh_history .zsh_history_bad;strings .zsh_history_bad > .zsh_history;fc -R .zsh_history;rm ~/.zsh_history_bad"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Directory to store zinit and plugins in
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit package manager if not found
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load Zinit package manager
source "${ZINIT_HOME}/zinit.zsh"

# Add PowerLevel10k font
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use VIM key bindings
bindkey -v
bindkey -M viins "jk" vi-cmd-mode

# Custom key bindings
#[[ ! -f ~/.keybindings.zsh ]] || source ~/.keybindings.zsh
bindkey "^[[1;5D" backward-word # CTRL + Left arrow
bindkey "^[[1;5C" forward-word # CTRL + Right arrow

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light akash329d/zsh-alias-finder

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::aliases
zinit light Aloxaf/fzf-tab

# Load autocompletions
autoload -Uz compinit
compinit

# History Keybindings; Initialize with CTRL + r
bindkey '^p' history-search-backward # Navigate with CTRL + p
bindkey '^n' history-search-forward # Navigate with CTRL + n

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling (default)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Completion styling (fzf) - Just press TAB
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)" # Initiate fuzzy search
eval "$(zoxide init --cmd cd zsh)" # Initate zioxide

# Created by `pipx` on 2024-07-15 08:03:32
export PATH="$PATH:/home/mitchel/.local/bin"
