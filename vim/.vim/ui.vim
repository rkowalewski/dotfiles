"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Termguicolors only if we have it and we are not in Windows WSL
if has('termguicolors') && (has('nvim') || (has("unix") && system("uname -r | grep Microsoft") == 1))
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
        AirlineRefresh
    endif
endfunction

function! Dark()
    echom "set bg=dark"
    set background=dark

    if (exists('g:colors_name') && g:colors_name ==# 'off')
        let g:airline_theme='hybrid'
        AirlineRefresh
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

    call Dark();
endfunction

try
    colorscheme hybrid_reverse
catch
endtry

set background=dark
let g:airline_theme= 'hybrid'
