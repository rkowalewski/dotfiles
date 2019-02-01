" set the runtime path to include Plug and initialize

call  plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'fxn/vim-monochrome'
Plug 'rkowalewski/vim-colors-off'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'reedes/vim-colors-pencil' "Colors Pencil Theme

" Airline
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mgee/lightline-bufferline'

" Tpopes must haves
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

" Text editing
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Tools
Plug 'szw/vim-maximizer'
Plug 'embear/vim-localvimrc'
if ((v:version >= '704' || has('nvim')))
    " Plug 'Chiel92/vim-autoformat'
    Plug 'sbdchd/neoformat'
endif
Plug 'romainl/vim-qf'
Plug 'mtth/scratch.vim'
Plug 'majutsushi/tagbar'
Plug 'chrisbra/vim-diff-enhanced'
" This Plugin obviously slows down vim.
"Plug 'kana/vim-fakeclip'

"" Other
Plug 'Christoomey/vim-tmux-navigator'
Plug 'psolyca/vim-bbye'
Plug 'junegunn/goyo.vim'
Plug 'CallumHoward/vim-neodark'

" see http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/
" for an explanation
Plug 'davidbeckingsale/writegood.vim', {'for' : ['markdown', 'tex'] }

" Fuzzy Find
if (has('unix') && !has('win32unix'))
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
else
    Plug 'FelikZ/ctrlp-py-matcher'
    Plug 'ctrlpvim/ctrlp.vim'
endif

if ((v:version >= '704' || has('nvim')) && executable('ctags'))
    Plug 'Ludovicchabant/vim-gutentags'
endif

Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

if (v:version > 800 || has('nvim')) && (has('python') || has('python3')) && executable('clang')
    "function! BuildYCM(info)
    "    " info is a dictionary with 3 fields
    "    " - name:   name of the plugin
    "    " - status: 'installed', 'updated', or 'unchanged'
    "    " - force:  set on PlugInstall! or PlugUpdate!
    "    if a:info.status == 'installed' || a:info.force
    "        ! sh $DOTFILES/contrib/install_ycm.sh
    "    endif
    "endfunction

    " Autocompletion
    Plug 'zchee/deoplete-clang'
   " Linting
    Plug 'w0rp/ale', {'for' : ['c','cpp']}
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => The Silver Searcher
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

let g:ale_c_build_dir_names = ['build.dev.clang', '.']

let g:ale_lint_on_text_changed = 'never'

let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'

let g:ale_open_list = 1
let g:ale_set_quickfix = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline#ale#indicator_warnings = '⚠'
let g:lightline#ale#indicator_errors = '✗'
let g:lightline#ale#indicator_ok = ''
let g:lightline#bufferline#read_only = "\ue0a2"
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#filename_modifier = ':~:.'
let g:lightline#bufferline#show_number=1


" Lightline
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [
            \       ['mode', 'paste'],
            \       ['fugitive'],
            \    ],
            \   'right': [
            \       ['percent'], ['lineinfo'],
            \       ['fileformat', 'fileencoding', 'filetype'],
            \       ['linter_warnings', 'linter_errors', 'linter_ok']
            \   ]
            \ },
            \ 'tabline': {
            \   'left': [['buffers']],
            \   'right': [['close']]
            \ },
            \ 'component': {
            \   'lineinfo': '%3l:%-2c',
            \ },
            \ 'component_expand': {
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'buffers': 'lightline#bufferline#buffers',
            \   'fugitive': 'LightLineFugitive',
            \   'gitgutter': 'LightLineGitGutter',
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified',
            \   'filename': 'LightLineFilename'
            \ },
            \ 'component_type': {
            \   'readonly': 'error',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'buffers': 'tabsel'
            \ },
            \ }

function! LightLineModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    elseif &modifiable
        return ""
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightLineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGitGutter()
    if ! exists('*GitGutterGetHunkSummary')
                \ || ! get(g:, 'gitgutter_enabled', 0)
                \ || winwidth('.') <= 90
        return ''
    endif
    let symbols = [
                \ g:gitgutter_sign_added,
                \ g:gitgutter_sign_modified,
                \ g:gitgutter_sign_removed
                \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
        if hunks[i] > 0
            call add(ret, symbols[i] . hunks[i])
        endif
    endfor
    return join(ret, ' ')
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

"if !exists('g:deoplete#omni#input_patterns')
"    let g:deoplete#omni#input_patterns = {}
"endif

if (1 == 1)

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  " set conceallevel=2 concealcursor=niv
endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" add Rg command for ripgrep
if (executable('rg'))
    command! -bang -nargs=* Rg
                \ call fzf#vim#grep(
                \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
                \   <bang>0 ? fzf#vim#with_preview('up:60%')
                \           : fzf#vim#with_preview('right:50%:hidden', '?'),
                \   <bang>0)
elseif (executable('ag'))
    command! -bang -nargs=* Ag
                \ call fzf#vim#ag(<q-args>,
                \ <bang>0 ? fzf#vim#with_preview('up:60%')
                \         : fzf#vim#with_preview('right:50%:hidden', '?'),
                \ <bang>0)
endif

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

let g:fzf_layout = { 'down': '~20%' }
