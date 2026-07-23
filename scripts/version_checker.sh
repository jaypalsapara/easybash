#!/bin/bash

# Usage: version_ge <current> <required>

version_ge() {
    [[ "$(printf '%s\n%s\n' "$2" "$1" | sort -V | head -n1)" == "$2" ]]
}