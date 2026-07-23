#!/bin/bash

### Show progress
# Echo progress with icon indicators

# Variables
CHECK="✔"
CROSS="✘"
INFO="➜"
SPINNER="●"
SPINNER_FRAMES=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')


## Static

# Usage: progress "Installing..."
progress(){
    printf "${BLUE}${SPINNER}${NC} %s" "$1"
}

# Usage: success "Installed successfully"
success() {
    printf "\r${GREEN}${CHECK}${NC} %s\n" "$1"
}

# Usage: fail "Installation failed"
fail() {
    printf "\r${RED}${CROSS}${NC} %s\n" "$1"
}


## Animated

# Usage: start_progress "Installing..."
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

# Usage: stop_progress <0|1> "Installed"
# Here 0 = true and 1 = false
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