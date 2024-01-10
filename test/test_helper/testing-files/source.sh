#!/bin/bash

echo "This is a test script"
test_var="oneliner"

if [[ test_var -eq "oneliner" ]]; then
    echo "This script will be used by BATS to test oneliner app functionality"
fi
note="This script is not to be ran separately. Only to be used by BATS"
for words in ${note[@]}; do
    printf "%s   " "$words"
    sleep 0.2
done