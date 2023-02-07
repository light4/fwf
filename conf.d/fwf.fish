#!/usr/bin/env fish

# fwf.fish is only meant to be used in interactive mode.
if not status is-interactive && test "$CI" != true
    exit
end

function set_current_cmd --on-event fish_preexec
    set -xU CURRENT_CMD $argv
end
