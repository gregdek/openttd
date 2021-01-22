#!/bin/bash

# We need to repackage the scorekeeper AI script
# every time we make changes. This is the script that
# does that.

tar -cf scorekeeper.tar scorekeeper
cp scorekeeper.tar ../content_download/ai/
