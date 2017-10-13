set nocompatible " be iMproved

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Plug and initialize
runtime vim-plug/plug.vim

call  plug#begin('~/.vim/plugged')

Plug 'fxn/vim-monochrome'
Plug 'blueshirts/darcula'
Plug 'pbrisbin/vim-colors-off'
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
Plug 'Christoomey/vim-tmux-navigator'

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
  Plug 'w0rp/ale', { 'tag' : 'v1.' }
endif

" All of your Plugins must be added before the following line
call plug#end()            " required

" Enable file type detection
filetype on
filetype plugin on
filetype indent on
syntax on


"Fix for Win32Yank Problem in Windows
"See https://github.com/neovim/neovim/issues/7021
"See https://github.com/neovim/neovim/issues/7031
"See $HOME/opt/bin/win32yank
"if !empty(matchstr(system("uname -a"), "microsoft"))
"   let g:clipboard = {
"       \ 'name': 'win32yank',
"       \ 'copy': {
"       \   '+': '$HOME/.config/nvim/wslnoerr.sh win32yank.exe -i --crlf',
"       \   '*': '$HOME/.config/nvim/wslnoerr.sh win32yank.exe -i --crlf',
"       \   },
"       \ 'paste': {
"       \   '+': '$HOME/.config/nvim/wslnoerr.sh win32yank.exe -o --lf',
"       \   '*': '$HOME/.config/nvim/wslnoerr.sh win32yank.exe -o --lf',
"       \   },
"       \ 'cache_enabled': 1,
"       \ }
"endif

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

" ----------------------------------------------------------------------
" | Automatic Commands                                                 |
" ----------------------------------------------------------------------

if has("autocmd")
  " Autocommand Groups.
  " http://learnvimscriptthehardway.stevelosh.com/chapters/14.html

  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  " Automatically reload the configurations from
  " the `~/.vimrc` file whenever they are changed.

  augroup auto_reload_vim_configs
    autocmd!
    autocmd BufWritePost $MYVIMRC so $MYVIMRC
  augroup END

  " Ignore quickfix windows in buffer list
  augroup ignore_buf_list
    autocmd!
    autocmd FileType qf set nobuflisted
  augroup END

  augroup tex
    autocmd!
    autocmd FileType tex setlocal tw=78|setlocal spell spelllang=en_us
  augroup END

  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  " Automatically strip the trailing
  " whitespaces when files are saved.

  augroup strip_trailing_whitespaces

    " List of file types that use the trailing whitespaces:
    "
    "  * Markdown
    "    https://daringfireball.net/projects/markdown/syntax#block

    let excludedFileTypes = [
          \ "markdown",
          \ "mkd.markdown"
          \]

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Only strip the trailing whitespaces if
    " the file type is not in the excluded list.

    autocmd!
    autocmd BufWritePre * if index(excludedFileTypes, &ft) < 0 | :call StripTrailingWhitespaces()

  augroup END

  augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    " Treat .json files as .js
    autocmd bufnewfile,bufread *.json setfiletype json syntax=javascript
    " treat .md files as markdown
    autocmd bufnewfile,bufread *.md setlocal filetype=markdown
    " treat .tex files as tex
    autocmd bufread,bufnewfile *.tex set filetype=tex
  augroup end
endif


" ----------------------------------------------------------------------
" | Helper Functions                                                   |
" ----------------------------------------------------------------------

function! StripTrailingWhitespaces()

  " Save last search and cursor position.

  let searchHistory = @/
  let cursorLine = line(".")
  let cursorColumn = col(".")

  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  " Strip trailing whitespaces.

  %s/\s\+$//e

  " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  " Restore previous search history and cursor position.

  let @/ = searchHistory
  call cursor(cursorLine, cursorColumn)

endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

" Basic Settings
source $HOME/.vim/basic.vim
" source $HOME/.vim/tmux.vim
source $HOME/.vim/syntax.vim
source $HOME/.vim/ui.vim
source $HOME/.vim/bindings.vim

" ----------------------------------------------------------------------
" | Local Settings                                                     |
" ----------------------------------------------------------------------

" Load local settings if they exist.
"
" [!] The following needs to remain at the end of this file in
"     order to allow any of the above settings to be overwritten
"     by the local ones.

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
