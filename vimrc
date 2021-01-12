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
set listchars=tab:▶\ ,eol:¬
set list
set textwidth=120

let mapleader=","

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

" Enable spell checking in git commit messages and latex.
autocmd Filetype gitcommit,tex setlocal spell spelllang=en_us

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

" Setup the compile rule for pdf to use pdflatex with synctex enabled
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'

" Suppress folding of environments
let g:Tex_FoldedEnvironments=''
let g:Tex_FoldedMisc=''

let g:Tex_GotoError=0

let g:Tex_IgnoredWarnings =
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'LaTeX Font Warning:'."\n".
    \'Citation %.%# undefined'."\n".
    \'LateX Warning: Empty'."\n".
    \'Package fmtcount Warning: %.%# already defined'."\n".
    \'Package glossaries Warning: Overriding %.%#'

let g:Tex_IgnoreLevel = 100000000

if has('mac')
    let g:Tex_ViewRule_ps = 'open -a Preview'
    let g:Tex_ViewRule_pdf = 'open -a Preview'
endif

" Compile with XeTex with \lx
"function CompileXeTex()
"    let oldCompileRule=g:Tex_CompileRule_pdf
"    let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
"    call Tex_RunLaTeX()
"    let g:Tex_CompileRule_pdf=oldCompileRule
"endfunction
"map <Leader>lx :<C-U>call CompileXeTex()<CR>

"------------------------------------------------------------------------------
" YouCompleteMe plugin settings
"------------------------------------------------------------------------------

let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1

nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>ty :YcmCompleter GetType<CR>
nnoremap <leader>dc :YcmCompleter GetDoc<CR>

"------------------------------------------------------------------------------
" rust.vim plugin settings
"------------------------------------------------------------------------------

let g:rustfmt_autosave = 1

"------------------------------------------------------------------------------
" vim-autoformat plugin settings
"------------------------------------------------------------------------------

" map <leader>cf in normal and visual mode
nnoremap <leader>cf :<C-u>Autoformat<CR>
vnoremap <leader>cf :Autoformat<CR>

" vim-autoformat seeks for configuration files of formatting tools starting from the current working directory upwards
" in the folder hierarchy. Therefore, this autocmd changes the window-local current directory to be the same as the
" directory of the current file. This ensures that vim-autoformat finds the right format configuration for the open
" file. This approach of automatically changing the current working directory follows
" https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file.
autocmd BufEnter * silent! lcd %:p:h

"------------------------------------------------------------------------------
" GUI things
"------------------------------------------------------------------------------

if has('gui_running')
    set gfn=Hack\ 11

    color codeschool

    " remove the menu tool
    set go-=m

    " remove the scroll bars
    set go-=T
    set go-=r
    set go-=L

    " suppress popups
    set go+=c
endif
