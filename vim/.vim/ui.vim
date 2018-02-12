"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('termguicolors')
    if (!has('nvim'))
        "we have to this for vim only
        " to insert these character, press <CTRL-V><ESC>
        set t_8f=[38;2;%lu;%lu;%lum
        set t_8b=[48;2;%lu;%lu;%lum
    endif
    set termguicolors
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Light()
    echom "set bg=light"
    set bg=light

    if (exists('g:colors_name') && (g:colors_name ==# 'off'))
        let g:airline_theme='light'
    endif
endfunction

function! Dark()
    echom "set bg=dark"
    set background=dark

    if (exists('g:colors_name') && g:colors_name ==# 'off')
        let g:airline_theme='hybrid'
    endif
endfunction

function! ToggleLightDark()
    if &bg ==# "light"
        call Dark()
    else
        call Light()
    endif
endfunction

function! CodeMode()
    try
        colorscheme off
    catch
    endtry

    call Dark()
endfunction

try
    colorscheme hybrid_reverse
catch
endtry

set background=dark
let g:airline_theme= 'hybrid'
