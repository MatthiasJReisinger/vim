
"------------------------------------------------------------------------------
" d412vv1n's vim settings
" ... probably not the smartest
"------------------------------------------------------------------------------

syntax on
set autoindent
set ruler
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
au BufRead,BufNewFile *.factor set filetype=forth
autocmd FileType make setlocal noexpandtab
execute pathogen#infect()
filetype plugin indent on
set number
command NT NERDTree

" let NERDTree show hidden files... apparently...
let NERDTreeShowHidden=1
