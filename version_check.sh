#!/bin/bash

## Insitialising version check variables
def_bash_version=$(printf "%d.%d" "${BASH_VERSINFO[0]}" "${BASH_VERSINFO[1]}")
req_bash_version=3.2
coreutils_version=$(ls --version 2> /dev/null || gls --version)
if [[ "${coreutils_version[*]:22:1}" = $'\n' ]]; then coreutils_version="${coreutils_version[*]:19:3}"
else coreutils_version="${coreutils_version[*]:19:4}"; fi
req_coreutils_version=8.22

## Initialising progress bar variables
func_list=("bash_check" "coreutils_check")
total=${#func_list[@]}
bar_size=50
current=0
msg_check=()

## Checking bash version 
bash_check() {
    if [[ $(echo "$def_bash_version $req_bash_version" | awk '{print ($1 < $2)}') == 1 ]]; then
        echo "You have BASH $def_bash_version, please upgrade to BASH $req_bash_version or above for best compatibility."
    fi
    return 1
}

##checking coreutils version
coreutils_check() {
    if [[ $(echo "$coreutils_version $req_coreutils_version" | awk '{print ($1 < $2)}') == 1 ]]; then
        echo "You have BASH $coreutils_version, please upgrade to BASH $req_coreutils_version or above for best compatibility."
    fi
    return 1
}

##to generate progress bar
progress_bar_gen()  {
    done=$1
    total=$2
    percent=$(echo "$done $total" | awk '{print ($1*100/$2)}')
    progress=$(echo "$percent $bar_size" | awk '{print ($1*$2/100)}')
    pending=$(echo "$bar_size $progress" | awk '{print ($1-$2)}')
    echo -ne "\rChecking dependencies : [$( printf "%${progress}s" | tr " " "#")$(printf "%${pending}s" | tr " " "-")] $percent"
}

main() {
    for func_check in "${func_list[@]}"; do
        msg_check+=("$($func_check)")
        current=$(( current+$? ))
        progress_bar_gen "$current" "$total"
        if [[ $current -eq $total ]]; then
            echo -e "\nAll dependencies are met."
        fi
    done
    for msg in "${msg_check[@]}"; do if [[ $msg != "" ]]; then echo "$msg"; fi; done
}
main
