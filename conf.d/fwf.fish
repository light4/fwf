#!/usr/bin/env fish

# fwf.fish is only meant to be used in interactive mode.
if not status is-interactive && test "$CI" != true
    exit
end

# set current_file $(status --current-filename)

set result "$(__fwf_main /dev/stdin $argv)"
set removed_fwf "$(echo -E $history[1] | sed -E 's/(.*)fwf /\1/g')"
echo "$removed_fwf $result"
