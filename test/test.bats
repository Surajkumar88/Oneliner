setup() { 
    load 'test_helper/common-setup'
    _common_setup
}

teardown() {
    :
}

@test 'oneliner no flag' {
    run oneliner
    refute_output ''
}

@test 'checking flag -v' {
    run oneliner -v
    assert_output -p 'v1.3.0'
}

@test 'checking flag -h' {
    run oneliner -h
    assert_output -p 'options'
}

@test 'checking the flag -f functionality' {
    run oneliner -f $PROJECT_ROOT/test/test_helper/testing-files/source.sh -p
    assert_output 'echo "This is a test script"; test_var="oneliner"; if [[ test_var -eq "oneliner" ]]; then; echo "This script will be used by BATS to test oneliner app functionality"; fi; note="This script is not to be ran separately. Only to be used by BATS"; for words in ${note[@]}; do; printf "%s " "$words"; sleep 0.2; done '
}

@test 'running with all the flags' {
    run oneliner -f $PROJECT_ROOT/test/test_helper/testing-files/source.sh -p -c -h -v -o -m
    assert_success
}
