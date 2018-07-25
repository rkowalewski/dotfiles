setlocal foldmethod=expr
setlocal spell
setlocal formatoptions=want
setlocal textwidth=78
setlocal wrapmargin=0

let g:formatdef_my_custom_markdown = '"par -w 78"'
let g:formatters_markdown = ['my_custom_markdown']
