"
" d412vv1n's vim config
" 
" ... probably not the smartest one
"

"------------------------------------------------------------------------------
" Global things
"------------------------------------------------------------------------------

syntax on
set autoindent
set ruler

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

execute pathogen#infect()
filetype plugin indent on
set number

set wildmenu

"------------------------------------------------------------------------------
" Automatic commands
"------------------------------------------------------------------------------

autocmd FileType make setlocal noexpandtab
autocmd BufRead,BufNewFile *.factor set filetype=forth

"------------------------------------------------------------------------------
" NERDTree plugin settings
"------------------------------------------------------------------------------

" let NERDTree show hidden files... apparently...
let NERDTreeShowHidden=1

" Toggle NERDTree on and off with F7
nmap <F7> :NERDTreeToggle<CR>

"------------------------------------------------------------------------------
" GUI things
"------------------------------------------------------------------------------

if has('gui_running')
    if has('mac')
        set gfn=Menlo\ Regular:h14
    else
        set gfn=Source\ Code\ Pro\ 11
    endif

    color codeschool
    
    " remove the menu tool
    set go-=m

    " remove the scroll bars
    set go-=T
    set go-=r
    set go-=L

    set listchars=tab:▶\ ,eol:¬
    set list
endif
