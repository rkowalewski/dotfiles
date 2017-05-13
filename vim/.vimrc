"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'W0rp/ale'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'Kien/ctrlp.vim'
Plugin 'Vim-airline/vim-airline'
Plugin 'Vim-airline/vim-airline-themes'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Bling/vim-bufferline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'Ludovicchabant/vim-gutentags'
Plugin 'Szw/vim-maximizer'
Plugin 'Jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tpope/vim-pathogen'
Plugin 'lifepillar/vim-solarized8'
Plugin 'Vim-syntastic/syntastic'
Plugin 'Christoomey/vim-tmux-navigator'
Plugin 'VundleVim/Vundle.vim'



" Use pathogen to inject all plugins
" let g:pathogen_disabled = []
" Does not work in windows --> disable it and use different approach
" call add(g:pathogen_disabled, 'vim-gutentags')
" call add(g:pathogen_disabled, 'vim-tmux-navigator')
" call add(g:pathogen_disabled, 'vim-syntastic')
" call add(g:pathogen_disabled, 'ale')
" vim-gutentags plugin requires at least version 7.4
" if v:version < '704' || !executable('ctags')
"  call add(g:pathogen_disabled, 'vim-gutentags')
" endif

" execute pathogen#infect()

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Enable file type detection
filetype on
filetype plugin on
filetype indent on
syntax on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set eol

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline

" Show “invisible” characters
set list listchars=tab:▸\ ,trail:·,nbsp:_

" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse-=a
set ttymouse=xterm2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

" Keep buffers open in background
set hidden

" Vim splits to the right and below
set splitbelow
set splitright

highlight Cursor guifg=black guibg=white

" ================ Line Breaks ======================
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set tw=78


" ================ Performance ======================
set ttyfast
set lazyredraw
syntax sync minlines=256

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
" 1 tab == 2 spaces
set tabstop=2                  " ┐
set softtabstop=2              " │ Set global <TAB> settings.
set shiftwidth=2               " │
set expandtab                  " ┘



" " ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set foldenable        "fold by default
set foldlevelstart=10   " open most folds by default

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ============= Formatting of Text ===================
if executable('par')
  set formatprg=par\ -w80
endif

" ================ Search ===========================
"
" Highlight dynamically as pattern is typed
set incsearch
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" ...unless we type a capital
set smartcase


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/undo
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    TMUX specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('$TMUX')
  " allows cursor change in tmux mode
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" However use it only if not running TMUX
  set clipboard=unnamed           " ┐
                                  " │ Use the system clipboard
  if has("unnamedplus")           " │ as the default register.
      set clipboard+=unnamedplus  " │
  endif
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" http://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w><C-h>
  map <C-j> <C-w>j
  map <C-k> <C-w><C-k>
  map <C-l> <C-w>l
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Solarzied Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256                   " Enable full-color support.


if !has("gui_running")
  " let g:solarized_contrast = "high"
  let g:solarized_termtrans = 0
  " let g:solarized_visibility = "high"
endif


fun! Solarized8Contrast(delta)
  let l:schemes = map(["_low", "_flat", "", "_high"], '"solarized8_".(&background).v:val')
  exe "colors" l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
endf

set background=dark
" See https://github.com/lifepillar/vim-solarized8
colorscheme solarized8_dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "let g:syntastic_always_populate_loc_list = 0
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_loc_list_height = 5
  let g:syntastic_c_check_header = 1
  let g:syntastic_cpp_check_header = 1
  let g:syntastic_debug = 0

"  let g:syntastic_html_checkers = [ "jshint" ]
"  let g:syntastic_javascript_checkers = [ "jshint" ]

" Disable syntax checking by default.:de

"let g:syntastic_mode_map = {
"    \ "active_filetypes": ["c", "cpp"],
"    \ "mode": "active",
"    \ "passive_filetypes": []
"\}


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Clang Format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#detect_style_file = 1
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ü <C-]>

let g:gutentags_exclude_project_root = []
call add(g:gutentags_exclude_project_root, $DOTFILES)
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
if !exists('g:airline_symbols')
    "let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 2
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'solarized'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#ale#enabled = 1
" let g:airline#enable#syntastic=1
"let g:airline#enable#bufferline=1

" enable syntastic extension with airline
" let g:airline#extensions#syntastic#enabled=1

let g:airline#extensions#ale#error_symbol = 'E:'
let g:airline#extensions#ale#warning_symbol = 'W:'

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_c_gcc_options = '-std=c99 -Wall -Wextra -Werror -pedantic -Wno-unused-function -Wno-unused-variable -DDART_ENABLE_ASSERTIONS -DDART_ENABLE_LOGGING -DDASH_ENABLE_PMEM -I./dart-impl/base/include -I./dart-impl/mpi/include -I./dart-impl/shmem/include -I./dart-if/include -I/home/kowalewski/opt/pmem/include -I/home/kowalewski/workspaces/googletest/googletest/include -I/opt/ohpc/pub/mpi/openmpi-gnu/1.10.4/include'
let g:ale_cpp_gcc_options = '-I../googletest/googletest/include -I./dash/include -I./dart-impl/mpi/include -I./dart-impl/base/include -I./dart-if/include -I/home/kowalewski/opt/pmem/include -I/home/kowalewski/workspaces/googletest/googletest/include -std=c++11 -Wall -Wextra -Wno-unused-function -Wno-missing-braces -Wno-sign-compare -Wno-format -Wno-unused-parameter -Wno-unused-variable -DDASH_ENABLE_LOGGING -DDASH_ENABLE_TEST_LOGGING -DDART_ENABLE_ASSERTIONS -DDART_ENABLE_LOGGING -DDASH_ENABLE_PMEM -DMPI_IMPL_ID'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" call airline#parts#define_function('ALE', 'ALEGetStatusLine')
"call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')

" let g:airline_section_error = airline#section#create_right(['ALE'])
" let g:airline_section_error = '%{ALEGetStatusLine()}'

"function! ALE() abort
"    return exists('*ALEGetStatusLine') ? ALEGetStatusLine() : ''
"endfunction
"let g:airline_section_error = '%{ALE()}'

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
       autocmd FileType java setlocal formatprg=par\ -w80\ -T4
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
       autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
       " Treat .md files as Markdown
       autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
       " Treat .tex files as tex
       autocmd BufRead,BufNewFile *.tex set filetype=tex
    augroup END
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

" ----------------------------------------------------------------------
" | Key Mappings                                                       |
" ----------------------------------------------------------------------

" Use a different mapleader (default is "\").

let mapleader = ","

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,* ] Search and replace the word under the cursor.

nmap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,cs] Clear search.

map <leader>cs <Esc>:noh<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,l ] Toggle `set list`.

nmap <leader>l :set list!<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,n ] Toggle `set relativenumber`.

let g:NumberToggleTrigger="<leader>n"

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,ts] Toggle Syntastic.

nmap <leader>ts :SyntasticToggleMode<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,v ] Make the opening of the `.vimrc` file easier.

nmap <leader>v :vsp $MYVIMRC<CR>


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,v ] Make the opening of the `.vimrc` file easier.

nmap <F4> :TagbarToggle <CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,W ] Sudo write.

map <leader>W :w !sudo tee %<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [, cf] ClangFormat

map <leader>cf :Autoformat<CR>
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,B ] switch betweeen dark and light color schemes
nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
  \ ? substitute(g:colors_name, 'dark', 'light', '')
  \ : substitute(g:colors_name, 'light', 'dark', '')
  \ )<cr>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,+ ] / [,- ] Increase / Decrease contrast of solarized theme
nmap <leader>- :<c-u>call Solarized8Contrast(-v:count1)<cr>
nmap <leader>+ :<c-u>call Solarized8Contrast(+v:count1)<cr>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,+ ] / [,- ] Increase / Decrease contrast of solarized theme
nnoremap <space>. :CtrlPTag<CR>
nnoremap <space>b :CtrlPBuffer<CR>


map <F2> :ls<CR>:b<Space>
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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
