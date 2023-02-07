function __fwf_main -d "fwf main"
    set tempfile $(mktemp /tmp/.fwf.XXXXXX)
    cat /dev/stdin > $tempfile

    set command "$argv"

    set preview_command "__fwf_columnate $tempfile (cat $tempfile | $command {q} 2>&1 | psub)"
    set command_string "$(echo '' | fzf --no-extended --print-query --preview-window up:90% --preview "$preview_command")"

    function shell_escape
        set single "'"
        set double '"'
        set escaped "$(1//$single/$single$double$single$double$single)"
        echo -E "$single$escaped$single"
    end

    rm $tempfile
    echo "$command_string"
end
