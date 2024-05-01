# --- nv aliases
alias nvo="/usr/local/bin/nvim"
alias nv="nvim"
alias nvv="nv -R"
alias nz="nv $CONFIG_DOTS/zsh/.zshrc"
alias nd="nv $CONFIG_DOTS"
ne() { nv "$HOME/git/personal/notes/${1:-"curr.md"}" }
# ---
# --- misc
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias psf='pstree'
else
    alias psf='ps --forest'
fi

alias rm='printf "Avoid using rm directly. Use rmi or \\\\rm instead.\n"'
alias rmi='\rm -i'
# ---
# --- update aliases
function starship.update() {
    local local_bin="$HOME/local/bin"
    sh -c "$(curl -sS https://starship.rs/install.sh)" -- -b "$local_bin"
}
# ---
