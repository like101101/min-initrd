#! /bin/bash

#Name of File where QEMU output is stored
test_output="test.out"

#Run boot test
make runU

#Check for Magic String to Verify that UKL Booted
#If Test fails, print QEMU output
if ! grep -sq "Symbiote Booted Successfully" "$test_output"; then
    echo "BOOT TEST FAIL"
    cat $test_output
    rm -f $test_output
    exit 1
fi

#Otherwise, print success message
echo "BOOT TEST PASS"

rm -f $test_output

exit 0
