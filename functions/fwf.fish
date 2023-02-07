function fwf -d "fwf - Filter With Feedback"
    # set current_file $(status --current-filename)

    __fwf_main $argv | read result
    set removed_fwf "$(echo -E $CURRENT_CMD | sed -E 's/(.*)fwf /\1/g')"
    set new_cmd "$removed_fwf $result"
    commandline -i $new_cmd
end
