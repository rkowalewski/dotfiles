" wrap lines
" linebreak and nolist should be set in basic.vim
"
setlocal wrap
setlocal textwidth=79
setlocal spell
setlocal wrapmargin=0

setlocal nospell

" ============= Formatting of Text ===================
if executable('par')
  " set formatprg=par\ -w79
  " done through remark and vim
endif

let g:neoformat_enabled_markdwon = ['prettier']
"let g:neoformat_run_all_formatters = 1


