"
" d412vv1n's vim config
" 
" ... probably not the smartest one
"

"------------------------------------------------------------------------------
" Global things
"------------------------------------------------------------------------------

execute pathogen#infect()

syntax on
set autoindent
set ruler
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set wildmenu
set scrolloff=0
set modeline

filetype plugin indent on

" disable all the annoying bells and window flushing... also see auto
" commands section below
set noeb vb t_vb=

"------------------------------------------------------------------------------
" Automatic commands
"------------------------------------------------------------------------------

autocmd FileType make setlocal noexpandtab
autocmd BufRead,BufNewFile *.factor set filetype=forth

" disable all kinds of bells
autocmd GUIEnter * set vb t_vb=

autocmd FileType tex set textwidth=80

"------------------------------------------------------------------------------
" NERDTree plugin settings
"------------------------------------------------------------------------------

" let NERDTree show hidden files... apparently...
let NERDTreeShowHidden=1

" Toggle NERDTree on and off with F7
nmap <F7> :NERDTreeToggle<CR>

"------------------------------------------------------------------------------
" vim-latex plugin settings
"------------------------------------------------------------------------------

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'

" Suppress folding of environments
let g:Tex_FoldedEnvironments=''

let g:Tex_GotoError=0

if has('mac')
    let g:Tex_ViewRule_ps = 'open -a Preview'
    let g:Tex_ViewRule_pdf = 'open -a Preview'
endif

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
