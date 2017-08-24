#!/bin/zsh

function dgu {
  [[ $# -ne 1 ]] && return 1

  /bin/grep -e '^.*\[\s*\(RUN\|OK\|ERROR\|PASSED\|--\+\)\s*\].*' -e "^\[\s\+$1.*"
}

function dgd {
  /bin/grep -e '^.*\[\s*\(RUN\|OK\|ERROR\|PASSED\|--\+\)\s*\].*' -e '^\[.*DEBUG.*'
}

function dgt {
  /bin/grep -e '^.*\[\s*\(RUN\|OK\|ERROR\|PASSED\|--\+\)\s*\].*' -e '^\[.*TRACE.*'
}
