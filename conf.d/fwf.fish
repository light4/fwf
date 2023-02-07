#!/usr/bin/env fish

# fwf.fish is only meant to be used in interactive mode.
if not status is-interactive && test "$CI" != true
    exit
end
