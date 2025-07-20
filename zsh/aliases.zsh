# --- nv aliases
alias nvo="/usr/local/bin/nvim"
alias nv="nvim"
alias nvv="nv -R"
alias nz="nv $CONFIG_DOTS/zsh/.zshrc"
alias nd="nv $CONFIG_DOTS"

nvl () {
    local file_name="$(cut -d":" -f1 <<< "$1")"
    local line_number="$(cut -d":" -f2 <<< "$1")"
    local line_column="$(cut -d":" -f3 <<< "$1")"
    (( "$line_column" > 0 )) && line_column=$((line_column - 1))
    nv "${file_name}" "+:norm ${line_number:-1}G${line_column:-1}l"
}

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

alias show_completions='for command completion in ${(kv)_comps}; do printf "%-32s %s\n" $command $completion; done | sort'
#

ansi_colors()
{
    echo -e "| [1;30m'1;30m'[0m | [1;31m'1;31m'[0m | [1;32m'1;32m'[0m | [1;33m'1;33m'[0m | [1;34m'1;34m'[0m | [1;35m'1;35m'[0m | [1;36m'1;36m'[0m | [1;37m'1;37m'[0m |
| [0;30m'0;30m'[0m | [0;31m'0;31m'[0m | [0;32m'0;32m'[0m | [0;33m'0;33m'[0m | [0;34m'0;34m'[0m | [0;35m'0;35m'[0m | [0;36m'0;36m'[0m | [0;37m'0;37m'[0m |
40m:[40m     [0m 41m:[41m     [0m 42m:[42m     [0m 43m:[43m     [0m 44m:[44m     [0m 45m:[45m     [0m 46m:[46m     [0m 47m:[47m     [0m"
}
# ---
