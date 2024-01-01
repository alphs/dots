# --- nv aliases
#nv() { nvim "$@"; }
alias nv="nvim"
alias nvv="nv -R"
alias nz='nv ~/.config/zsh/.zshrc'
alias nw='nv ~/.config/wezterm/wezterm.lua'
ne() { nv "$HOME/git/personal/notes/${1:-"curr.md"}" }
# ---
# --- misc
alias ll='ls -la'
alias psf='pstree'
# ---
# --- update aliases
alias wez.update="brew upgrade --cask wezterm-nightly --no-quarantine --greedy-latest"
function starship.update() {
    local local_bin="$HOME/local/bin"
    sh -c "$(curl -sS https://starship.rs/install.sh)" -- -b "$local_bin"
}
# ---
