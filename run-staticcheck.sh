#!/usr/bin/env bash

failed=false

for file in "$@"; do
    # redirect stderr so that violations and summaries are properly interleaved.
    if ! staticcheck -tests=false -f stylish ./... 2>&1
    then
        failed=true
    fi
done

if [[ $failed == "true" ]]; then
    exit 1
fi
