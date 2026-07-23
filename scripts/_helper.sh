#!/bin/bash

# Import plugins scripts
source "$(dirname "${BASH_SOURCE[0]}")/log.sh"
source "$(dirname "${BASH_SOURCE[0]}")/progress.sh"
source "$(dirname "${BASH_SOURCE[0]}")/basic_checker.sh"
source "$(dirname "${BASH_SOURCE[0]}")/advanced_checker.sh"
source "$(dirname "${BASH_SOURCE[0]}")/package_checker.sh"
source "$(dirname "${BASH_SOURCE[0]}")/version_checker.sh"
source "$(dirname "${BASH_SOURCE[0]}")/storage_checker.sh"