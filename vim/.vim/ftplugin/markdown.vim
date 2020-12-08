" wrap lines
" linebreak and nolist should be set in basic.vim
"
setlocal wrap
setlocal textwidth=79
setlocal spell
setlocal wrapmargin=0

setlocal spell

" ============= Formatting of Text ===================
if executable('par')
  " set formatprg=par\ -w79
  " done through remark and vim
endif

let g:neoformat_enabled_markdwon = ['prettier']
"let g:neoformat_run_all_formatters = 1

set fo-=q

set norelativenumber
" colorscheme seoul256
execute 'hi SpellBad   gui=underline guisp=White'

inoremap <leader><space><space> <C-V>u00a0

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [
            \       ['mode', 'paste'],
            \       ['fugitive'],
            \    ],
            \   'right': [
            \       ['percent', 'wordcount'], ['lineinfo'],
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
            \ 'component_function': {
            \   'wordcount': 'WordCount',
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



