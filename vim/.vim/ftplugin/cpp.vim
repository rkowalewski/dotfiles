let g:neoformat_cpp_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style=file'],
            \ 'stdin': 1
            \ }

let g:neoformat_enabled_cpp = ['clangformat']
