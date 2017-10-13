" ----------------------------------------------------------------------
" | Key Mappings                                                       |
" ----------------------------------------------------------------------

" " ================ Basic ============================

" Use a different mapleader (default is "\").

let mapleader = ","
" Remap VIM 0 to first non-blank character
map 0 ^

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Jump to tag (Gutentags)
nnoremap ü <C-]>

" ================ YCM  =============================
nnoremap <silent> <Leader>yd :YcmCompleter GetDoc<CR>
nnoremap <silent> <Leader>yf :YcmCompleter FixIt<CR>
nnoremap <silent> <Leader>yg :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>yi :YcmCompleter GoToInclude<CR>
nnoremap <silent> <Leader>yt :YcmCompleter GetType<CR>


" ================ Buffers, Tabs, Windows ============

" Close the current buffer
map <silent> <leader>bd :Bclose<CR>:hide<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
au TabLeave * let g:lasttab = tabpagenr()
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" ================ Misc ============

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,* ] Search and replace the word under the cursor.

nmap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,cs] Clear search.

map <leader>cs <Esc>:noh<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,n ] Toggle `set relativenumber`.
nnoremap <silent><leader>n :set relativenumber!<cr>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,ts] Toggle Syntastic.

nmap <leader>ts :SyntasticToggleMode<CR>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,v ] Make the opening of the `.vimrc` file easier.

nmap <leader>v :vsp $MYVIMRC<CR>


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


" [,W ] Sudo write.

map <leader>W :w !sudo tee %<CR>

" [,w ] Fast saving.
nmap <leader>w :w!<cr>

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [, cf] ClangFormat

map <leader>cf :Autoformat<CR>
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [,.] / [,b] CtrlP Mappings
nnoremap <space>. :CtrlPTag<CR>
nnoremap <space>b :CtrlPBuffer<CR>
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" [, c] Toggle Light / Dark Color Theme
nnoremap <leader>c :call ToggleLightDark()<CR>
