#!/bin/bash

source "$(dirname "${BASH_SOURCE[0]}")/scripts/_helper.sh"

if ! has php; then
    fail "PHP not found"
fi