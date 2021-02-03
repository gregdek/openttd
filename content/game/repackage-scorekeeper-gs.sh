#!/bin/bash

# We need to repackage the scorekeeper AI script
# every time we make changes. This is the script that
# does that.

tar -cf scorekeeper-gs.tar scorekeeper-gs
cp scorekeeper-gs.tar ../content_download/game/
