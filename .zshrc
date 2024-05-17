# Aliases
alias ls="ls --color"
alias ll="ls -slah --color"
alias update="sudo apt update -y; sudo apt upgrade -y; sudo apt dist-upgrade -y; sudo apt autoclean -y; sudo apt auto-remove -y"

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

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit light Aloxaf/fzf-tab

# Load autocompletions
autoload -Uz compinit
compinit

# History Keybindings; Initialize with CTRL + r
bindkey -e
bindkey '^p' history-search-backward # Navigate with CTRL + p
bindkey '^n' history-search-forward # Navigate with CTRL + p

# Home key bindings
bindkey '^[[H' beginning-of-line   # Home (common sequence)
bindkey '^[OH' beginning-of-line   # Home (alternate sequence)

# End key bindings
bindkey '^[[F' end-of-line         # End (common sequence)
bindkey '^[OF' end-of-line         # End (alternate sequence)

# Delete key bindings
bindkey '^?' backward-delete-char  # Delete
bindkey '^[[3~' delete-char        # Delete (common sequence)

# Backspace key binding
bindkey '^H' backward-delete-char  # Backspace

# Arrow keys bindings
bindkey '^[[D' backward-char       # Left arrow
bindkey '^[[C' forward-char        # Right arrow
bindkey '^[[A' up-line-or-history  # Up arrow
bindkey '^[[B' down-line-or-history # Down arrow

# Page Up and Page Down key bindings
bindkey '^[[5~' beginning-of-buffer-or-history  # Page Up
bindkey '^[[6~' end-of-buffer-or-history        # Page Down

# Insert key binding
bindkey '^[[2~' overwrite-mode     # Insert

# F1-F12 function keys bindings
bindkey '^[[[A'  vi-cmd-mode       # F1
bindkey '^[[[B'  vi-backward-word  # F2
bindkey '^[[[C'  vi-forward-word   # F3
bindkey '^[[[D'  vi-backward-char  # F4
bindkey '^[[[E'  vi-forward-char   # F5
bindkey '^[[17~' vi-repeat-find    # F6
bindkey '^[[18~' vi-find-next-char # F7
bindkey '^[[19~' vi-change-to-end-of-line # F8
bindkey '^[[20~' vi-yank-to-end-of-line # F9
bindkey '^[[21~' vi-delete-to-end-of-line # F10
bindkey '^[[23~' vi-insert          # F11
bindkey '^[[24~' vi-append          # F12

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
eval "$(fzf --zsh)" # Initiate fuzzy search with CTRL + r
