set nocompatible " be iMproved

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime vim-plug/plug.vim
source $HOME/.vim/plugins.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/basic.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/ui.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/bindings.vim


"Fix for Win32Yank Problem in Windows
"See https://github.com/neovim/neovim/issues/7021
"See https://github.com/neovim/neovim/issues/7031
"See $HOME/opt/bin/win32yank
"if !empty(matchstr(system("uname -a"), "microsoft"))
"   let g:clipboard = {
"       \ 'name': 'win32yank',
"       \ 'copy': {
"       \   '+': '$HOME/.config/nvim/wslnoerr.sh win32yank.exe -i --crlf',
"       \   '*': '$HOME/.config/nvim/wslnoerr.sh win32yank.exe -i --crlf',
"       \   },
"       \ 'paste': {
"       \   '+': '$HOME/.config/nvim/wslnoerr.sh win32yank.exe -o --lf',
"       \   '*': '$HOME/.config/nvim/wslnoerr.sh win32yank.exe -o --lf',
"       \   },
"       \ 'cache_enabled': 1,
"       \ }
"endif



" ----------------------------------------------------------------------
" | Local Settings                                                     |
" ----------------------------------------------------------------------

" Load local settings if they exist.
"
" [!] The following needs to remain at the end of this file in
"     order to allow any of the above settings to be overwritten
"     by the local ones.

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
