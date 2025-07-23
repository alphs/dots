# zmodload zsh/zprof

local zap_path="${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
[ -f "$zap_path" ] && source "$zap_path" || echo "Zap not installed, mby run '$CONFIG_DOTS/scripts/zap_install.sh -k'"


## Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zsh-users/zsh-syntax-highlighting"
plug "zdharma-continuum/fast-syntax-highlighting"
#
## Local
plug "$CONFIG_DOTS/zsh/aliases.zsh"
plug "$CONFIG_DOTS/zsh/exports.zsh"
plug "$CONFIG_DOTS/zsh/binds.zsh"
plug "$CONFIG_DOTS/zsh/opts.zsh"
plug "$CONFIG_DOTS/zsh/zsh-lsd.zsh"
plug "$CONFIG_DOTS/zsh/nix-stuff.zsh"
# Should be last
plug "$CONFIG_DOTS/zsh/completions.zsh"

eval "$(fzf --zsh)"
bindkey -M vicmd '^R' redo # fzf overrides all modes

eval "$(zoxide init zsh --cmd cd)"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Should be at the end
eval "$(starship init zsh)"
# zprof
