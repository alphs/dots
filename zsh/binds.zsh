# binds.zsh

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^X' edit-command-line
bindkey '^X^E' exchange-point-and-mark

export KEYTIMEOUT=20
set -o vi

# 'main' is viins if 'set -o vi', man zshzle
bindkey -M main '^P' up-line-or-history  # history-beginning-search-backward
bindkey -M main '^N' down-line-or-history  # history-beginning-search-forward
bindkey -M main '^A' beginning-of-line
bindkey -M main '^E' end-of-line
bindkey -M main '^B' backward-char
bindkey -M main '^F' forward-char
bindkey -M main '^D' delete-char
bindkey -M main '^K' kill-line
bindkey -M main '^U' backward-kill-line
bindkey -M main '^W' backward-kill-word
bindkey -M main '^Y' yank
bindkey -M main '^R' history-incremental-search-backward

bindkey -M main '\ef' forward-word
bindkey -M main '\eb' backward-word

