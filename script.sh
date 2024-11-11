#!/bin/bash
set -e

# Compile the programs
g++ code.cpp -o code
g++ gen.cpp -o gen
g++ brute.cpp -o brute

# Run the stress test
for ((i = 1; ; ++i)); do
    echo "Running test $i"
    
    # Generate a test case
    ./gen $i > input_file
    
    # Run both solutions
    ./code < input_file > myAnswer
    ./brute < input_file > correctAnswer

    # Compare outputs
    if ! diff -q myAnswer correctAnswer > /dev/null; then
        echo "Test failed on case $i"
        echo "==== Failing Test Case ===="
        cat input_file
        echo "==== Your Answer ===="
        cat myAnswer
        echo "==== Expected Answer ===="
        cat correctAnswer
        break
    else
        echo "Test $i passed"
    fi
done
