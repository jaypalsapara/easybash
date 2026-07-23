# EasyBash

A library of bunch of functions and pre-written code that make bash script easy and fast to write.


## How to use

Here is folder called `/scripts` can download from this repo, Every helper and pre-written code here. You can import to your main bash file and use it.

ex: 

install.sh
```shell
#!/bin/bash

# Import other scripts
source "$(dirname "${BASH_SOURCE[0]}")/scripts/_helper.sh"

# Import individual script.
# source "$(dirname "${BASH_SOURCE[0]}")/scripts/log.sh"


### Main script

EXIT_CODE=0

### 1. Check requirements

# PHP

MIN_PHP_VERSION=8.4

log "\nCheck requirements:" BLUE

progress "Checking php..."

if package_exists php; then 

    # Check version
    PHP_VERSION=$(php -r "echo PHP_VERSION;")
    
    if version_ge $PHP_VERSION $MIN_PHP_VERSION; then 
        success "PHP version ${PHP_VERSION}";
    else 
        fail "Minimum PHP ${MIN_PHP_VERSION} version is required"
    fi

else

    EXIT_CODE=1
    fail "PHP check fail $(log "(not found or not configure)" YELLOW)"

fi
```


## Contribute

You can contribute to grow this library.

### Step to contribute

1. Fork this repo
2. Add/Update your code
3. Create PR


Note: Write maintainable code.