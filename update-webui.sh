#!/bin/bash 
DIR=$(dirname "$(readlink -f "$0")")

$DIR/pull.sh
cd scada.js
./install-modules.sh
gulp --webapp showcase --production
