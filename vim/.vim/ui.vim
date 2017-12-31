"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("termguicolors") && has("nvim")
  set termguicolors
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Light()
    echom "set bg=light"
    set bg=light
    "colorscheme off
    "set nocursorline
    let g:airline_theme='light'
    AirlineRefresh
    " set list
endfunction

function! Dark()
    echom "set bg=dark"
    set background=dark
    let g:airline_theme='monochrome'
    "colorscheme monochrome
    "set cursorline
    AirlineRefresh
    " darcula fix to hide the indents:
    " set nolist
endfunction

function! ToggleLightDark()
  if &bg ==# "light"
    call Dark()
  else
    call Light()
  endif
endfunction

" Always set background before colorscheme
let g:airline_theme= 'monochrome'
set background=dark

try
  colorscheme off
  " For whatever reason we have to set it again
  "set background=dark
catch
endtry
