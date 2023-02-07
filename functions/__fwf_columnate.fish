function __fwf_columnate -d "fwf columnate"
    function wrap
        set cols $(tput cols)
        set halfcols $(math round $cols/2)
        fold -s -w $halfcols "$argv[1]";
    end

    function columnate
        pr -w $cols -m -t (wrap "$argv[1]" | psub) (wrap "$argv[2]" | psub)
    end

    columnate "$argv[1]" "$argv[2]"
end
