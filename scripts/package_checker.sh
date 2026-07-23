#!/bin/bash

# Note: Checker work with if conditions


### Package checker
# Pass package name to check

# Usage: has php; has node;
package_exists() {
    command -v "$1" >/dev/null 2>&1
}

