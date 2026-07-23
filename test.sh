#!/bin/bash

# Import other scripts
source "$(dirname "${BASH_SOURCE[0]}")/scripts/_helper.sh"


### Main script

if version_gt 2.55.1 2.54.1 ; then
    success "Pass"
else
    fail "Fail"
fi