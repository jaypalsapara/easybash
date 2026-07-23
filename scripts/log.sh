#!/bin/bash

### Log message with colors
# Show your message with colors

# Variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

# Usage: log "hello world" RED;
log() {
    local color="${!2}"
    echo -e "${color}${1}${NC}"
}