#!/usr/bin/env zsh

# basicly https://github.com/wintermi/zsh-lsd/blob/main/zsh-lsd.plugin.zsh
# but with minor changes

# Exit if the 'lsd' command could not be found
if ! (( $+commands[lsd] )); then
    echo "WARNING: 'lsd' command not found"
    return
fi

# Create alias override commands using 'lsd'
alias ls='lsd --group-directories-first'
alias ll='lsd -l --group-directories-first'
alias la='lsd -lA --group-directories-first'
function tree() {
    local depth="${1:-2}"
    "lsd -l --group-directories-first --tree --depth=$depth"
}
