#!/usr/bin/env bash

last() {

    wrap() { printf "%b" "%C(${1})${2}%C(reset)" ; }

    red()    { wrap "red"    "$1" ; }
    yellow() { wrap "yellow" "$1" ; }
    blue()   { wrap "blue"   "$1" ; }
    green()  { wrap "green"  "$1" ; }

    local format="'$(red "%h")$(yellow "%d") - %s $(blue "[%cn]") $(green "(%cr)")'"
    local n="${1:-2}"
    local ref="${2:-'HEAD'}"

    local git_command="git -c color.ui=always \
        log --pretty=format:$format \
        --decorate -n$n $ref"

    if [ "$n" -gt 2 ]; then
        eval "$git_command" | nl -w2 -s": "
    else
        eval "$git_command"
    fi
}

last "$@"
