# if we are interactive
if [[ $- == *i* ]]; then
    if grep -q Microsoft /proc/version; then
        export SHELL=zsh
        exec zsh -l
    fi
    # In Linux we can simply change the shell with chsh
fi


source /home/rkowalewski/.config/broot/launcher/bash/br
