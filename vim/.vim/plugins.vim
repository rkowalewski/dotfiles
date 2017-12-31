" set the runtime path to include Plug and initialize

call  plug#begin('~/.vim/plugged')

Plug 'fxn/vim-monochrome'
Plug 'rkowalewski/vim-colors-off'
Plug 'blueshirts/darcula'
Plug 'morhetz/gruvbox' " Gruvbox Theme
Plug 'reedes/vim-colors-pencil' "Colors Pencil Theme
Plug 'LaTeX-Box-Team/LaTeX-Box' "Latex-Box
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Vim-airline/vim-airline'
Plug 'Vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'Szw/vim-maximizer'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'embear/vim-localvimrc'
Plug 'Chiel92/vim-autoformat'
Plug 'romainl/vim-qf'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'Christoomey/vim-tmux-navigator'
Plug 'psolyca/vim-bbye'

if ((v:version >= '704' || has('nvim')) && executable('ctags'))
  Plug 'Ludovicchabant/vim-gutentags'
endif

if (v:version > 800 || has('nvim')) && (has('python') || has('python3')) && executable('clang')
  function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
      ! sh $DOTFILES/contrib/install_ycm.sh
    endif
  endfunction

  Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
  Plug 'w0rp/ale'
endif

" All of your Plugins must be added before the following line
call plug#end()            " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:loaded_syntastic_plugin')
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_loc_list_height = 5
  let g:syntastic_c_check_header = 1
  let g:syntastic_cpp_check_header = 1
  let g:syntastic_debug = 0
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gutentags_exclude_project_root = []
call add(g:gutentags_exclude_project_root, $DOTFILES)

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" => The silver seacher
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 2
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#ale#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable YCM Linting, we only want auto completion
let g:ycm_show_diagnostics_ui = 0

let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
let g:ycm_key_list_accept_completion = ['<C-y>']

let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist=['~/.vim/*']

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = "<<"
let g:ycm_always_populate_location_list = 0
let g:ycm_auto_trigger=1
let g:ycm_max_diagnostics_to_display=10000
let g:ycm_min_num_identifier_candidate_chars=0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_open_loclist_on_ycm_diags=1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_filetype_blacklist={
      \ 'vim' : 1,
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'md' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'objc' : 1,
      \ 'mail' : 1
      \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => .lvimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Never ask if we want to load .lvimrc
let g:localvimrc_ask = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE Syntax Linting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
      \ 'cpp' : ['clang'],
      \ 'c' : ['clang']
      \}

let g:ale_c_build_dir_names = ['build.dev', 'build', 'bin']

let g:ale_lint_on_text_changed = 'never'

let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'

let g:ale_c_clang_options = ''
let g:ale_cpp_clang_options = ''

let g:ale_open_list = 1
let g:ale_set_quickfix = 1


"Simply Stolen from https://github.com/liuchengxu/space-vim/blob/master/layers/%2Bcheckers/syntax-checking/config.vim

" For a more fancy ale statusline
function! ALEGetError()
  let l:res = ale#statusline#Status()
  if l:res ==# 'OK'
    return ''
  else
    let l:e_w = split(l:res)
    if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
      return ' •' . matchstr(l:e_w[0], '\d\+') .' '
    endif
  endif
endfunction

function! ALEGetWarning()
  let l:res = ale#statusline#Status()
  if l:res ==# 'OK'
    return ''
  else
    let l:e_w = split(l:res)
    if len(l:e_w) == 2
      return ' •' . matchstr(l:e_w[1], '\d\+')
    elseif match(l:e_w, 'W') > -1
      return ' •' . matchstr(l:e_w[0], '\d\+')
    endif
  endif
endfunction
