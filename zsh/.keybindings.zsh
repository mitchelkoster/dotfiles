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
bindkey "^[[1;5D" backward-word # CTRL + Left arrow
bindkey "^[[1;5C" forward-word # CTRL + Right arrow

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

