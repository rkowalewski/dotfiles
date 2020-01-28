#! /usr/bin/env zsh

function csv_cat() {
    if [[ "$#" -eq 0 ]]; then
        echo "no csv files given"
        return 0
    fi

    awk '(NR == 1 || FNR > 1) {print}' $@
}

function csv_pretty {
    column -t -s, -n "$@" | less -#2 -N -F -S -X -K
}

function csv_filter {
    local _pat="$(echo $@ | sed 's#\\$#\$#g')"
    awk -F',' "(NR == 1 || ${_pat}) {print}"
}

