#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/colors.sh"


### Log message with colors
# Show your message with colors

# Usage: log "hello world" RED;
log() {
    local color="${!2}"
    echo -e "${color}${1}${NC}"
}