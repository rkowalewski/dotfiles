#!/bin/zsh

# Redirect make output to less
function lmake {
  script -c "make $@ 2>&1" /dev/null < /dev/null |& less -R
}

# Adam Sharp
# Aug 21, 2013
#
# Usage: Add it to your PATH and `git remove-submodule path/to/submodule`.
#
# Does the inverse of `git submodule add`:
#  1) `deinit` the submodule
#  2) Remove the submodule from the index and working directory
#  3) Clean up the .gitmodules file
#

function git_remove_submodule {
  submodule_name=$(echo "$1" | sed 's/\/$//'); shift

  if git submodule status "$submodule_name" >/dev/null 2>&1; then
    git submodule deinit -f "$submodule_name"
    git rm -f "$submodule_name"
    rm -rf ".git/modules/$submodule_name"

    if [ -z "$(cat .gitmodules)" ]; then
      git rm -f .gitmodules
    else
      git add .gitmodules
    fi
  else
    echo "fatal: Submodule '$submodule_name' not found" 1>&2
  fi
}

function pretty_csv {
    column -t -s, -n "$@" | less -F -S -X -K
}

