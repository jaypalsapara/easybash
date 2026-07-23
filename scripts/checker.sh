#!/bin/bash

### Package checker
# Pass package name to check


# Usage: has php; has node;
has() {
    command -v "$1" >/dev/null 2>&1
}