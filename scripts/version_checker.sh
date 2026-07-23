#!/bin/bash

### Version getter then or equal to required
# Compare version

# Usage: version_ge <current> <required>
version_ge() {
    [[ "$(printf '%s\n%s\n' "$2" "$1" | sort -V | head -n1)" == "$2" ]]
}

# Usage: version_le <current> <required>
version_le() {
    [[ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | head -n1)" == "$1" ]]
}

# Usage: version_eq <current> <required>
version_eq() {
    [[ "$1" == "$2" ]]
}

# Usage: version_lt <current> <required>
version_lt() {
    [[ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | head -n1)" == "$1" && "$1" != "$2" ]]
}

# Usage: version_gt <current> <required>
version_gt() {
    [[ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | head -n1)" == "$2" && "$1" != "$2" ]]
}

# Usage: $(normalize_version "v8.4.1-beta")
normalize_version() {
    printf '%s' "$1" | grep -oE '[0-9]+(\.[0-9]+)+'
}