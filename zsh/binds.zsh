# binds.zsh

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M main '^X^X' edit-command-line

export KEYTIMEOUT=20
set -o vi

# 'main' is viins if 'set -o vi', man zshzle
bindkey -M main '^P' up-history
bindkey -M main '^N' down-history
bindkey -M main '^A' beginning-of-line
bindkey -M main '^E' end-of-line
bindkey -M main '^B' backward-char
bindkey -M main '^F' forward-char
bindkey -M main '^D' delete-char
bindkey -M main '^K' kill-line
bindkey -M main '^U' backward-kill-line
bindkey -M main '^W' backward-kill-word

bindkey -M main '^[[Z' reverse-menu-complete    # 'shift-tab'

bindkey -M main '^R' history-incremental-search-backward # this will be overwritten by fzf if present
