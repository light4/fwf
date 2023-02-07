function fwf -d "fwf - Filter With Feedback"
    # set current_file $(status --current-filename)

    set result "$(__fwf_main /dev/stdin $argv)"
    set removed_fwf "$(echo -E $history[1] | sed -E 's/(.*)fwf /\1/g')"
    echo "$removed_fwf $result"
end
