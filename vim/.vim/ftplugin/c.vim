let g:neoformat_c_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style=file'],
            \ 'stdin': 1
            \ }

let g:neoformat_enabled_c = ['clangformat']
