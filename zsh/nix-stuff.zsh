
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

export HELPDIR="$HOME/.nix-profile/share/zsh/$ZSH_VERSION/help"

# # ln -sf "$HOME/.nix-profile/share/fzf/completion.zsh" "$CONFIG_DOTS/zsh/completion/_fzf"
# cp "$HOME/.nix-profile/share/fzf/completion.zsh" "$CONFIG_DOTS/zsh/completion/_fzf"
# chmod u+w "$CONFIG_DOTS/zsh/completion/_fzf"
# sed -i "1i #compdef fzf" "$CONFIG_DOTS/zsh/completion/_fzf"

# ln -sf "$HOME/.nix-profile/share/git/contrib/completion/git-completion.zsh" "$CONFIG_DOTS/zsh/completion/_git"

# --- nix stuff
