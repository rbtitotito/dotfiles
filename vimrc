"------------------------------------------------------------------------------
" File: $HOME/.vimrc
" Author: Rob Brown <rbrown@medicusins.com> 
"------------------------------------------------------------------------------

version 1.0
"------------------
" Pathogen
"------------------
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

"------------------------------------------------------------------------------
" Standard stuff.
"------------------------------------------------------------------------------

set number
set ruler
set showmatch
set showmode
set textwidth=0
set undolevels=1000
set history=1000
set ignorecase
set incsearch
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set ttyfast
set ttyscroll=0
set hlsearch
set showbreak=+
set nostartofline
set wildmode=list:longest
set wildchar=<TAB>
if has("syntax")
	syntax on
endif
if &term =~ "xterm"
	set background=dark
endif

"------------------------------------------------------------------------------
" Function keys.
"------------------------------------------------------------------------------

" F1: Toggle hlsearch (highlight search matches).
nmap <F1> :set hls!<CR>
" F2: Toggle list (display unprintable characters).
nnoremap <F2> :set list!<CR>
" F5: Insert current date.
cmap w!! %!sudo tee > /dev/null %
