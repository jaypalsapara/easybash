#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/colors.sh"
source "$(dirname "${BASH_SOURCE[0]}")/icons.sh"

### Show progress
# Echo progress with icon indicators

# Variables
SPINNER_FRAMES=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
LAST_PROGRESS=""


## Static

# Usage: progress "Installing..."
progress(){
   LAST_PROGRESS="$1"
   printf "\r${BLUE}${SPINNER}${NC} %s" "$LAST_PROGRESS"
}

# Usage: success "Installed successfully"
success() {
    local msg="${1:-$LAST_PROGRESS}"
    printf "\r\033[K${GREEN}${CHECK}${NC} %s\n" "$msg"
}

# Usage: fail "Installation failed"
fail() {
    local msg="${1:-$LAST_PROGRESS}"
    printf "\r\033[K${RED}${CROSS}${NC} %s\n" "$msg"
}

info() {
    local msg="${1:-$LAST_PROGRESS}"
    printf "\r\033[K${CYAN}${INFO}${NC} %s\n" "$msg"
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

# Usage: progress_bar <current> <total> [label]
progress_bar() {
    local current="$1"
    local total="$2"
    local label="${3:-}"
    local width=40

    local percent=$(( current * 100 / total ))
    local filled=$(( current * width / total ))
    local empty=$(( width - filled ))

    if [[ "$current" -eq "$total" ]]; then
        filled=$width
        empty=0
    fi

    local filled_bar=$(printf '%0.s█' $(seq 1 $filled))
    local empty_bar=$(printf '%0.s░' $(seq 1 $empty))

    if [[ $empty -eq '0' ]]; then
        empty_bar=''
    fi

    printf "\r${CYAN}!${NC} %s [${WHITE}%s${NC}%s] %3s (%s) " \
        "$label" \
        "$filled_bar" \
        "$empty_bar" \
        "${percent}%" \
        "${current}/${total}" >&2

    if [[ "$current" -eq "$total" ]]; then
        printf "\n" >&2
    fi
}