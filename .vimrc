" double-quotes are comments for the .vimrc file
set nonumber
set notitle
"
set noexpandtab " Make sure that every file uses real tabs, not spaces
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line
" Set the tab width
let s:tabwidth=4
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop='.s:tabwidth
"
set nocompatible
set nocp
set backspace=indent,eol,start
"
colo desert2
"colo desert
"colo ron
"colorscheme indus2
"colorscheme industry
"colorscheme slate
"colorscheme nivram
syntax on
if &diff
    syntax off
endif
"set line numbers grey"
"highlight LineNr ctermfg=grey
set hlsearch
" set term=xterm-256
" set t_Co=8
" set t_Sb=m
" set t_Sf=m
" WORD WRAPPING
" set wrap       " turn word wrapping on
set nowrap   " turn word wrapping off
set linebreak  " don't split words
set nolist     " list disables linebreak
set textwidth=0
set wrapmargin=0
" set formatoptions-=t
" set formatoptions+=l
set listchars=eol:$
" set listchars=eol:$,tab:<->,space:.,trail:~,extends:>,precedes:<,conceal:?,nbsp:+
"
""""""""""""""""""""""""""""""""""""
" key bindings (custom shortcuts)
""""""""""""""""""""""""""""""""""""
" ':set [no]paste
nnoremap <F2> :set invpaste paste?<CR>
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>
set pastetoggle=<F2>
set showmode
" Insert newline without entering insert mode
nmap <CR> O<Esc>j
"
