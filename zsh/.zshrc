#zmodload zsh/zpro

local zap_path="${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
[ -f "$zap_path" ] && source "$zap_path" || echo "Zap not installed, mby run '$CONFIG_DOTS/scripts/zap_install.sh -k'"

# --- default
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
# --- plugs
#plug "zsh-users/zsh-history-substring-search"
# --- local
plug "$CONFIG_DOTS/zsh/aliases.zsh"
plug "$CONFIG_DOTS/zsh/exports.zsh"
plug "$CONFIG_DOTS/zsh/binds.zsh"
plug "$CONFIG_DOTS/zsh/zsh-lsd.zsh"
#plug "$CONFIG_DOTS/zsh/nix-stuff.zsh"
# ---

# --- nix stuff, cba figuring out fpath issue
# Nix
# if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
#    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
# fi
# End Nix

typeset -U path cdpath fpath manpath

for profile in ${(z)NIX_PROFILES}; do
  fpath+=($profile/share/zsh/site-functions $profile/share/zsh/$ZSH_VERSION/functions $profile/share/zsh/vendor-completions)
done

HELPDIR="/nix/store/qlqypbb4z48g6xsfc9d79w2fka2c8635-zsh-5.9/share/zsh/$ZSH_VERSION/help"

# # ln -sf "$HOME/.nix-profile/share/fzf/completion.zsh" "$CONFIG_DOTS/zsh/completion/_fzf"
# cp "$HOME/.nix-profile/share/fzf/completion.zsh" "$CONFIG_DOTS/zsh/completion/_fzf"
# chmod u+w "$CONFIG_DOTS/zsh/completion/_fzf"
# sed -i "1i #compdef fzf" "$CONFIG_DOTS/zsh/completion/_fzf"

# ln -sf "$HOME/.nix-profile/share/git/contrib/completion/git-completion.zsh" "$CONFIG_DOTS/zsh/completion/_git"

fpath+=("$CONFIG_DOTS/zsh/completion")

# --- nix stuff

HISTFILE="$HOME/.zsh_history"

zstyle ':completion:*:*:git:*' script "$HOME/.nix-profile/share/git/contrib/completion/git-completion.bash"

eval "$(fzf --zsh)" # ...

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(zoxide init zsh --cmd cd)"

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Should be at the end
eval "$(starship init zsh)"
#zprof
