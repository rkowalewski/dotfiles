set nocompatible " be iMproved

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

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
