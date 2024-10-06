#!/bin/bash
set -euo pipefail

if [ $# != 2 ]; then
    echo "usage: $0 <build or typecheck> <target .saty file>" >/dev/stderr
    exit 1
fi

BASENAME="$(basename "$2")"

case "$1" in
"build")
    make document.pdf
    ;;
"typecheck")
    saphe build --text-mode latex --type-check-only --full-path -o "${BASENAME%saty}pdf" "$BASENAME"
    ;;
esac
