"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
" esckeys does not work in Neovim
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif

" Use a different mapleader (default is "\").
let mapleader = ","

" Don’t add empty newlines at the end of files
" set binary
" set eol

if (v:version > '704')
    set fixeol " Fix end of line if missing
endif

" Automatically reload file if changed from outside
set autoread

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Do not show the cursorline
set nocursorline
set nocursorcolumn

" Enable line numbers
set number
if (v:version >= '703')
    set relativenumber
endif

function! __has_wsl()
    return (has('unix') && system("uname -r | grep Microsoft") != 0)
endfunction

if (!has('nvim') && __has_wsl() == 1)
    " Disable this for native WSL Vim due to double minus performance
    " see https://github.com/vim/vim/issues/282
    set norelativenumber
endif

" Show “invisible” characters
set list listchars=tab:▸\ ,trail:·,nbsp:_

" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse-=a
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Do not show the mode --> Airlines handles it
set noshowmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Height of the command bar
set cmdheight=2

" Keep buffers open in background
set hidden

" Vim splits to the right and below
set splitbelow
set splitright

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" The time in milliseconds that is waited for a mapped sequence to complete
set timeoutlen=500

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2

" A file that matches with one of these patterns is ignored when expanding
" wildcards, completing file or directory names, and influences the result of
" |expand()|, |glob()| and |globpath()| unless a flag is passed to disable this

" Object files
set wildignore=*.o,*~,*.pyc
" Latek:set x files
set wildignore+=*.aux,*.fdb_latexmk,*.fls
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Performance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (!has('nvim'))
  "Assume fast terminal in VIM
  set ttyfast
  " Do not redraw while executing macros
  set lazyredraw
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line breaks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set tw=79

if (v:version >= '703')
    set colorcolumn=85
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set smarttab
" 1 tab == 2 spaces
set tabstop=4                  " ┐
set softtabstop=4              " │ Set global <TAB> settings.
set shiftwidth=4               " │
set expandtab                  " ┘

if has('autocmd')
  augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd Filetype go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype c setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter *.sh setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
    " Treat .json files as .js
    autocmd bufnewfile,bufread *.json setfiletype json syntax=javascript
    " treat .md files as markdown
    autocmd bufnewfile,bufread *.md setlocal filetype=markdown
    " treat .tex files as tex
    autocmd bufread,bufnewfile *.tex set filetype=tex
  augroup end
endif


""""""""""""""""""""""""""""""
" => Buffers, Tabs and Windows
""""""""""""""""""""""""""""""

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab
" Do always show tabline
set showtabline=2

" Close the current buffer
"map <silent> <leader>bd :Bclose<CR>:hide<cr>
map <leader>bd :Bdelete<cr>

" Close all the buffers
map <leader>ba :bufdo :Bdelete<cr>


""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" " ================ Folds ============================

" Add a bit extra margin to the left
"set foldcolumn=1
set foldmethod=indent     " fold based on indent
set foldnestmax=3         " deepest fold is 3 levels
set nofoldenable          " fold by default
set foldlevelstart=10     " open most folds by default

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ============= Formatting of Text ===================
if executable('par')
  set formatprg=par\ -w78
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
" Turn backup off, since most stuff is in SVN, git etc anyway...
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
    autocmd FileType fzf set nobuflisted
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

