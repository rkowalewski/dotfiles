" set the runtime path to include Plug and initialize

call  plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'fxn/vim-monochrome'
Plug 'rkowalewski/vim-colors-off'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'reedes/vim-colors-pencil' "Colors Pencil Theme
Plug 'nightsense/cosmic_latte'
Plug 'nightsense/snow'

" Airline
Plug 'itchyny/lightline.vim'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Tpopes must haves
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

" Text editing
Plug 'godlygeek/tabular', {'for' : ['markdown', 'tex'] }
Plug 'plasticboy/vim-markdown'
" see http://matt.might.net/articles/shell-scripts-for-passive-voice-weasel-words-duplicates/
" for an explanation
Plug 'davidbeckingsale/writegood.vim', {'for' : ['markdown', 'tex'] }

" Tools
Plug 'szw/vim-maximizer'
Plug 'embear/vim-localvimrc'
if ((v:version >= '704' || has('nvim')))
    Plug 'sbdchd/neoformat'
endif
Plug 'mtth/scratch.vim'
Plug 'majutsushi/tagbar'

"" Other
Plug 'Christoomey/vim-tmux-navigator'

Plug 'psolyca/vim-bbye'
Plug 'junegunn/goyo.vim'
Plug 'CallumHoward/vim-neodark'
Plug 'tyrannicaltoucan/vim-deep-space'

Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'Lokaltog/vim-monotone'
Plug 'huyvohcmc/atlas.vim'
Plug 'KKPMW/distilled-vim'
Plug 'https://git.sr.ht/~romainl/vim-bruin'
Plug 'robertmeta/nofrils'
Plug 'axvr/photon.vim'
Plug 'liuchengxu/space-vim-dark'


" Fuzzy Find
if (has('unix') && !has('win32unix'))
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
endif

if ((v:version >= '704' || has('nvim')) && executable('ctags'))
    Plug 'Ludovicchabant/vim-gutentags'
endif

" Plug 'Shougo/deoplete.nvim'
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

    Plug 'w0rp/ale'
    Plug 'maximbaz/lightline-ale'
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
" let g:ctrlp_match_window = 'bottom,order:ttb'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
"
" if executable('ag')
"     " Use ag over grep
"     set grepprg=ag\ --nogroup\ --nocolor
"
"     " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif
"
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

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
let g:ale_c_parse_compile_commands = 1
"let g:ale_cpp_clang_options = ''

let g:ale_lint_on_text_changed = 'normal'

function! WordCount()
    let currentmode = mode()
    if !exists("g:lastmode_wc")
        let g:lastmode_wc = currentmode
    endif
    " if we modify file, open a new buffer, be in visual ever, or switch modes
    " since last run, we recompute.
    if &modified || !exists("b:wordcount") || currentmode =~? '\c.*v' || currentmode != g:lastmode_wc
        let g:lastmode_wc = currentmode
        let l:old_position = getpos('.')
        let l:old_status = v:statusmsg
        execute "silent normal g\<c-g>"
        if v:statusmsg == "--No lines in buffer--"
            let b:wordcount = 0
        else
            let s:split_wc = split(v:statusmsg)
            if index(s:split_wc, "Selected") < 0
                let b:wordcount = str2nr(s:split_wc[11])
            else
                let b:wordcount = str2nr(s:split_wc[5])
            endif
            let v:statusmsg = l:old_status
        endif
        call setpos('.', l:old_position)
        return b:wordcount
    else
        return b:wordcount
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

"if !exists('g:deoplete#omni#input_patterns')
"    let g:deoplete#omni#input_patterns = {}
"endif

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  " set conceallevel=2 concealcursor=niv
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Polyglot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:polyglot_disabled = ['csv']


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

"======= Mappings ============"
nmap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
