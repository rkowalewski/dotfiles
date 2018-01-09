"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("termguicolors")
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
        let g:airline_theme='monochrome'
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

try
    colorscheme hybrid_reverse
catch
endtry

set background=dark
let g:airline_theme= 'hybrid'
