"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("termguicolors") && has("nvim")
  "set termguicolors
endif

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Solarzed Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has("gui_running")
   "let g:solarized_contrast = high
   "let g:solarized_termtrans = 0
   "let g:solarized_visibility = high
endif

try
  " See https://github.com/lifepillar/vim-solarized8
  colorscheme NeoSolarized
catch
endtry

set background=dark

" default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 0

fun! Solarized8Contrast(delta)
  let l:schemes = map(["_low", "_flat", "", "_high"], '"solarized8_".(&background).v:val')
  exe "colors" l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
endf