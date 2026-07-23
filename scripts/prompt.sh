#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/colors.sh"

# Usage: ask "Question" "default"
ask() {
    local answer
    local prompt="$1"
    local default="$2"

    if [[ -n "$default" ]]; then
        read -erp $'\e[36m?\e[0m '"$prompt"$' \e[33m['"$default"$']\e[0m: ' answer
        printf '%s' "${answer:-$default}"
    else
        read -erp $'\e[36m?\e[0m '"$prompt"$': ' answer
        printf '%s' "$answer"
    fi
}