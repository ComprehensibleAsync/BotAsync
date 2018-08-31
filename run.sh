#!/bin/bash
trap 'break'; exit 0 SIGINT SIGTERM
function git-try-pull() {
    git pull --all
}
FAIL=0
while true; do
    if [ ${FAIL} -eq 4 ]; then
        git-try-pull
        let FAIL=0
    fi
        python .server.py
        node .server.js
        EXIT=${?}
    if [ ${EXIT} -ne 0 ]; then
         let FAIL=${FAIL}+1
    else
        let FAIL=0
    fi
        sleep 1
done