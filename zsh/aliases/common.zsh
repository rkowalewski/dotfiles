# Redirect make output to less
function lmake {
  script -c "make $@ 2>&1" /dev/null < /dev/null |& less -R
}
