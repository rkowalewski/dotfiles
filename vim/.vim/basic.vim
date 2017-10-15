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
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
" set binary
set eol
" Automatically reload file if changed from outside
set autoread

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

" Show “invisible” characters
set list listchars=tab:▸\ ,trail:·,nbsp:_

" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse-=a
" ttymouse does not work in neovim
"set ttymouse=xterm2
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
set tm=500

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Performance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ttyfast
" Do not redraw while executing macros
set lazyredraw

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line breaks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
set tw=79
set formatoptions=qrn1
"set colorcolumn=85

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set smarttab
" 1 tab == 2 spaces
set tabstop=2                  " ┐
set softtabstop=2              " │ Set global <TAB> settings.
set shiftwidth=2               " │
set expandtab                  " ┘

""""""""""""""""""""""""""""""
" => Buffers, Tabs and Windows
""""""""""""""""""""""""""""""

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry


""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" " ================ Folds ============================

" Add a bit extra margin to the left
"set foldcolumn=1
set foldmethod=indent "  fold based on indent
set foldnestmax=3     "  deepest fold is 3 levels
set foldenable        "fold by default
set foldlevelstart=10 "   open most folds by default

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
