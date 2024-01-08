setup() { 
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

teardown() {
    :
    # rm -f /tmp/bats-tut-project-ran
}

get_mysh_welcome_msg() {
    my.sh 2>&1 | grep Welcome
}


@test 'runing my.sh' {
    if [[   -e /tmp/bats-tut-project-ran ]]; then
        skip 'The First_run_file already exists'
    fi

    run my.sh
    assert_output -p 'Welcome to our project.'

    run my.sh
    refute_output -p 'Welcome to our project.'

}
