#!/usr/bin/env zsh

# basicly https://github.com/wintermi/zsh-lsd/blob/main/zsh-lsd.plugin.zsh
# but with minor changes

# Exit if the 'lsd' command could not be found
if ! (( $+commands[lsd] )); then
    echo "WARNING: 'lsd' command not found" >&2
    return
fi

# Create alias override commands using 'lsd'
alias ls='lsd --group-directories-first'
alias ll='lsd -lA --group-directories-first --date=relative'
alias la='lsd -la --group-directories-first'

function tree() {
    local depth="${1:-2}"
    [ $# -gt 0 ] && shift
    lsd --tree --group-directories-first --depth="$depth" "$@"
}
