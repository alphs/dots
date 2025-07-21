
alias nvo="/usr/local/bin/nvim"
alias nv="nvim"
alias nvv="nv -R"
alias nvf="NVIM_APPNAME=nv nv"

nvl () {
    local r=$reset_color
    if [[ -z "$1" ]]; then
        print -r -- "${fg[green]}Usage:${r} ${rg[green]}nvl${r} ${fg[yellow]}<file>${r}[:${fg[blue]}line${r}[:${fg[magenta]}column${r}]]" >&2
        return 1
    fi

    local -a parts=("${(@s/:/)1}")

    local file_name="${parts[1]}"
    local line_number="${parts[2]:-1}"
    local column_number="${parts[3]:-1}"

    nv -c ":call cursor(${line_number}, ${column_number})" -- "${file_name}"
}

ne() { nv "$HOME/git/personal/notes/${1:-"curr.md"}" }

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

zsh_colors() {
    # 'man zshcontrib' for all colors and attributes
    local r=$reset_color
    print -- \
    "| '${fg[black]}\${fg[black]}${r}'      "\
    "| '${fg[red]}\${fg[red]}${r}'     "\
    "| '${fg[green]}\${fg[green]}${r}'      "\
    "| '${fg[yellow]}\${fg[yellow]}${r}'      "\
    "| '${fg[blue]}\${fg[blue]}${r}'      "\
    "| '${fg[magenta]}\${fg[magenta]}${r}'      "\
    "| '${fg[cyan]}\${fg[cyan]}${r}'      "\
    "| '${fg[white]}\${fg[white]}${r}'      |"
    print -- \
    "| '${fg_bold[black]}\${fg_bold[black]}${r}' "\
    "| '${fg_bold[red]}\${fg_bold[red]}${r}'"\
    "| '${fg_bold[green]}\${fg_bold[green]}${r}' "\
    "| '${fg_bold[yellow]}\${fg_bold[yellow]}${r}' "\
    "| '${fg_bold[blue]}\${fg_bold[blue]}${r}' "\
    "| '${fg_bold[magenta]}\${fg_bold[magenta]}${r}' "\
    "| '${fg_bold[cyan]}\${fg_bold[cyan]}${r}' "\
    "| '${fg_bold[white]}\${fg_bold[white]}${r}' |"
    print -- \
    "| '${bg[black]}\${bg[black]}${r}'${fg[black]}      "\
    "| '${bg[red]}\${bg[red]}${r}'${fg[black]}     "\
    "| '${bg[green]}\${bg[green]}${r}'${fg[black]}      "\
    "| '${bg[yellow]}\${bg[yellow]}${r}'${fg[black]}      "\
    "| '${bg[blue]}\${bg[blue]}${r}'${fg[black]}      "\
    "| '${bg[magenta]}\${bg[magenta]}${r}'${fg[black]}      "\
    "| '${bg[cyan]}\${bg[cyan]}${r}'${fg[black]}      "\
    "| '${bg[white]}\${bg[white]}${r}'${fg[black]}      |"
}
