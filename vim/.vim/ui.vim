"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('termguicolors')
    if (!has('nvim') || !empty($TMUX))
        "we have to this for vim only
        " to insert these character, press <CTRL-V><ESC>
        set t_8f=[38;2;%lu;%lu;%lum
        set t_8b=[48;2;%lu;%lu;%lum
    endif
    set termguicolors
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme snow

" autocmd BufEnter * colorscheme snow
" autocmd BufEnter *.md colorscheme seoul256

autocmd WinEnter * doautocmd FileType
au FileType markdown   color seoul256
au FileType tex        color seoul256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = '⚠'
let g:lightline#ale#indicator_errors = '✗'
let g:lightline#ale#indicator_ok = ""

let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#filename_modifier = ':.'
let g:lightline#bufferline#show_number=1


" Lightline
let g:lightline = {
            \ 'colorscheme': 'snow_dark',
            \ 'active': {
            \   'left': [
            \       ['mode', 'paste'],
            \       ['fugitive'],
            \    ],
            \   'right': [
            \       ['percent'], ['lineinfo'],
            \       ['fileformat', 'fileencoding', 'filetype'],
            \       ['linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok']
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
            \   'linter_checking': 'lightline#ale#checking',
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'linter_ok': 'lightline#ale#ok',
            \   'buffers': 'lightline#bufferline#buffers',
            \   'fugitive': 'LightLineFugitive',
            \   'gitgutter': 'LightLineGitGutter',
            \   'readonly': 'LightLineReadonly',
            \   'modified': 'LightLineModified',
            \   'filename': 'LightLineFilename'
            \ },
            \ 'component_type': {
            \   'readonly': 'error',
            \   'linter_checking': 'left',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'linter_ok': 'left',
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


