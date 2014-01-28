set nocompatible               " be iMproved
set backspace=2         " backspace in insert mode works like normal editor
set number              " line numbers
set nobackup            " get rid of anoying ~file
set showmatch
set hidden
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundles from Github
"
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-git'
Bundle 'ervandew/supertab'
Bundle 'kevinw/pyflakes-vim'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/pep8'
Bundle 'alfredodeza/pytest.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'sontek/rope-vim'
Bundle 'kien/ctrlp.vim'

" Syntax highlighting
syntax on                    " syntax highlighing
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

" Solarized stuff
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" NerdTree
map <F2> :NERDTreeToggle<CR>

" Code Folding
set foldmethod=indent
set foldlevel=99

" Window Movement
"       Vertical Split : Ctrl+w + v
" 	Horizontal Split: Ctrl+w + s
" 	Close current windows: Ctrl+w + q
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Task List
map <leader>td <Plug>TaskList

" Gundo toggle
map <leader>g :GundoToggle<CR>

" Quickfix window
" :copen " Open the quickfix window
" :ccl   " Close it
" :cw    " Open it if there are 'errors', close it otherwise (some people prefer this)
" :cn    " Go to the next error in the window
" :cnf   " Go to the first error in the next file

" Pyflakes
let g:pyflakes_use_quickfix = 0 	" no quickfix window

" Pep8
let g:pep8_map='<F7>'

" Tab Completion and Doc
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview " to remove pydoc preview, set completeopt-=preview

" CtrlP
map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>

" Ropevim
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Ack
nmap <leader>a <Esc>:Ack!

" Fugitive
set statusline=%{fugitive#statusline()}

