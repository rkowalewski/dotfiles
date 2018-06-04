#!/bin/zsh

alias dgres="/bin/grep -e '^\[=*\]' -e '^.*\[.*\(OK\|PASSED\|RUN\|ERROR\).*\]'"
alias dgv="dgres -e '^\[.*DEBUG.*$'"
alias dgvv="dgres -e '^\[.*\(TRACE\|DEBUG\).*$'"
alias dgo="grep -v -e '^.*\(DEBUG\|TRACE\).*'"

