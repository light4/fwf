function fwf -d "fwf - Filter With Feedback"
    # set current_file $(status --current-filename)

    __fwf_main $argv | read result
    set removed_fwf "$(echo -E $history[1] | sed -E 's/(.*)fwf /\1/g')"
    set new_cmd "$removed_fwf $result"
    commandline -i $new_cmd
end
