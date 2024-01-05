#!/bin/bash

def_bash_version=$(printf "%d.%d" "${BASH_VERSINFO[0]}" "${BASH_VERSINFO[1]}")
req_bash_version=3.2
coreutils_version=$(ls --version 2> /dev/null || gls --version)
coreutils_version="${coreutils_version[*]:19:3}"
req_coreutils_version=8.22

bash_check() {
    if [[ $(bc <<< "$def_bash_version < $req_bash_version") -eq 1 ]]; then
        echo "You have BASH $def_bash_version, please upgrade to BASH $req_bash_version or above for best compatibility."
    fi
}

coreutils_check() {
    if [[ $(bc <<< "$coreutils_version < $req_coreutils_version") -eq 1 ]]; then
        echo "You have BASH $coreutils_version, please upgrade to BASH $req_coreutils_version or above for best compatibility."
    fi
}

main() {
    echo "Checking dependencies..."
    bash_check
    coreutils_check
    echo "Dependencies are installed."
}

main
