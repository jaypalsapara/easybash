#!/bin/bash

# Icons
CHECK="✔"
CROSS="✘"
INFO="➜"
SPINNER="●"
SPINNER_FRAMES=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')

# Static

progress(){
    printf "${BLUE}${SPINNER}${NC} %s" "$1"
}

success() {
    printf "\r${GREEN}${CHECK}${NC} %s\n" "$1"
}

fail() {
    printf "\r${RED}${CROSS}${NC} %s\n" "$1"
}


# Animated

start_progress() {
    local msg="$1"

    (
        local i=0
        while :; do
            printf "\r${BLUE}%s${NC} %s..." \
                "${SPINNER_FRAMES[$((i % ${#SPINNER_FRAMES[@]}))]}" \
                "$msg"
            ((i++))
            sleep 0.1
        done
    ) &

    SPINNER_PID=$!
}

stop_progress() {
    local status=$1
    local msg="$2"

    kill "$SPINNER_PID" 2>/dev/null
    wait "$SPINNER_PID" 2>/dev/null

    if [[ $status -eq 0 ]]; then
        success "$msg"
    else
        fail "$msg"
    fi
}