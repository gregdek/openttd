#!/bin/bash
set -e
set -x

# For now, this script is just to test the viability of adding
# content after the VOLUME has been mounted in the Dockerfile.
# If it works, I should be able to touch a file in 
# /home/openttd/.openttd and test to see if that file exists
# after deployment.

echo "Hello!" > /home/openttd/.openttd/content-test.txt
