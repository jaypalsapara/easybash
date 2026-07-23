#!/bin/bash

# Note: Checker work with if conditions

### File checker

# Usage: file_exists <path>
file_exists() {
    [[ -f "$1" ]]
}

# Usage: dir_exists <path>
dir_exists() {
    [[ -d "$1" ]]
}

# Usage: path_exists <path>
path_exists() {
    [[ -e "$1" ]]
}

# dir_empty <path>
dir_empty() {
    [[ -d "$1" && -z "$(ls -A "$1" 2>/dev/null)" ]]
}