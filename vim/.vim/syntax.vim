
let g:ale_linters = {
      \ 'cpp' : ['clang'],
      \ 'c' : ['clang']
      \}

let g:ale_c_build_dir_names = ['build.dev', 'build', 'bin']

let g:ale_lint_on_text_changed = 'never'

let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'

let g:ale_c_clang_options = ''
let g:ale_cpp_clang_options = ''

let g:ale_open_list = 1
let g:ale_set_quickfix = 1


"Shamelessly stolen from https://github.com/liuchengxu/space-vim/blob/master/layers/%2Bcheckers/syntax-checking/config.vim

" For a more fancy ale statusline
function! ALEGetError()
  let l:res = ale#statusline#Status()
  if l:res ==# 'OK'
    return ''
  else
    let l:e_w = split(l:res)
    if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
      return ' •' . matchstr(l:e_w[0], '\d\+') .' '
    endif
  endif
endfunction

function! ALEGetWarning()
  let l:res = ale#statusline#Status()
  if l:res ==# 'OK'
    return ''
  else
    let l:e_w = split(l:res)
    if len(l:e_w) == 2
      return ' •' . matchstr(l:e_w[1], '\d\+')
    elseif match(l:e_w, 'W') > -1
      return ' •' . matchstr(l:e_w[0], '\d\+')
    endif
  endif
endfunction
