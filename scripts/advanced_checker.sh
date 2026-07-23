#!/bin/bash

# Usage: check_any '<condition1>' '<condition2>' ...
check_any() {
    local condition

    for condition in "$@"; do
        if eval "[[ $condition ]]"; then
            return 0
        fi
    done

    return 1
}

# Usage: check_every '<condition1>' '<condition2>' ...
check_every() {
    local condition

    for condition in "$@"; do
        if ! eval "[[ $condition ]]"; then
            return 1
        fi
    done

    return 0
}