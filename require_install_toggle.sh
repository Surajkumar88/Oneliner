#!/bin/bash

## Insitialising version check variables
def_bash_version=$(printf "%d.%d" "${BASH_VERSINFO[0]}" "${BASH_VERSINFO[1]}")
req_bash_version=3.2
coreutils_version=$(ls --version 2> /dev/null || gls --version)
coreutils_version="${coreutils_version[*]:19:3}"
req_coreutils_version=8.22

## Initialising progress bar variables
func_list=("bash_check" "coreutils_check")
total=${#func_list[@]}
bar_size=50
bar_scope=2
current=0
msg_check=()

bash_check() {
    if [[ $(bc <<< "$def_bash_version < $req_bash_version") -eq 1 ]]; then
        echo "You have BASH $def_bash_version, please upgrade to BASH $req_bash_version or above for best compatibility."
    fi
    return 1

}

coreutils_check() {
    if [[ $(bc <<< "$coreutils_version < $req_coreutils_version") -eq 1 ]]; then
        echo "You have BASH $coreutils_version, please upgrade to BASH $req_coreutils_version or above for best compatibility."
    fi
    return 1

}

progress_bar_gen()  {
    done=$1
    total=$2
    percent=$(bc <<< "scale=$bar_scope; $done*100/$total")
    progress=$(bc <<< "scale=$bar_scope; $percent*$bar_size/100")
    pending=$( bc <<< "scale=$bar_scope; $bar_size-$progress")
    echo -ne "\rChecking dependencies : [$( printf "%${progress}s" | tr " " "#")$(printf "%${pending}s" | tr " " "-")] $percent"
}

main() {
    for func_check in "${func_list[@]}"; do
        msg_check+=("$($func_check)")
        current=$(( current+$? ))
        progress_bar_gen "$current" "$total"
        # echo "$testvar"
        if [[ $current -eq $total ]]; then
            echo -e "\nAll dependencies are met."
        fi
    done
    for msg in "${msg_check[@]}"; do if [[ $msg != "" ]]; then echo "$msg"; fi; done
}

main
