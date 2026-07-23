#!/bin/bash

# Usage: spacer [count]
spacer() {
    local count="${1:-1}"

    while (( count-- > 0 )); do
        printf '\n'
    done
}

# Usage: in_array <needle> <item1> <item2> ...
in_array() {
    local needle="$1"
    shift

    local item
    for item in "$@"; do
        [[ "$needle" == "$item" ]] && return 0
    done

    return 1
}