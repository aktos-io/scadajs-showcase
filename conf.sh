#!/bin/bash

# ---------------------------------------------------------------------------------
# Find scada.js folder by searching upwards and add it into the NODE_PATH variable
# ---------------------------------------------------------------------------------

find_scada_root () {
    local name=""
    testing_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    while :; do
        name=$(basename $testing_dir)
        ls "$testing_dir/scada.js" > /dev/null 2>&1
        if [[ "$?" == "0" ]]; then
            echo "$testing_dir/scada.js"
            return 0
        elif [[ "$name" == "scada.js" ]]; then
            echo $testing_dir
            return 0
        elif [[ "$name" == "/" ]]; then
            return 255
        else
            testing_dir=$(realpath "$testing_dir/..")
        fi
    done
}

SCADA=$(find_scada_root)

if [[ "$SCADA" == "" ]]; then 
    echo "scada.js root can not be found. exiting."
    exit 255
fi

export NODE_PATH="${SCADA}/node_modules:${SCADA}/src/lib:$NODE_PATH"
