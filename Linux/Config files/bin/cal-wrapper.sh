#!/bin/sh
# cal wrapper: use defaults only when no args are given

if [ "$#" -eq 0 ]; then
    exec /usr/bin/cal -3 -c1
else
    exec /usr/bin/cal "$@"
fi
