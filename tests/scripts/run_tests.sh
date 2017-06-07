#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: ./run_tests.sh <test_dir> <uarch_name>"
fi

for file in $(find $1 -name \*.test ); do
    echo "Running $file";
    ../../src/pipecheck -i $file -o out/$(basename $file).out -m ../../uarches/tutorial/$2.uarch;
done
