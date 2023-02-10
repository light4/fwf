function __fwf_main -d "fwf main"
    set tempfile $(mktemp /tmp/.fwf.XXXXXX)
    cat /dev/stdin > $tempfile

    set command "$argv"

    set preview_command "__fwf_columnate $tempfile (cat $tempfile | $command {q} 2>&1 | psub)"
    set command_string "$(echo '' | fzf --no-extended --print-query --preview-window up:90% --preview "$preview_command")"

    function shell_escape
        set single "'"
        set double '"'
        set escaped $(string replace -a $single $single$double$single$double$single $argv[1])
        echo -E "$single$escaped$single"
    end

    rm $tempfile
    shell_escape "$command_string"
end
