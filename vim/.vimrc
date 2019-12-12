" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

augroup END

else

set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
              \ | wincmd p | diffthis
endif





"**********************************************************************************
" My own configuration 
"**********************************************************************************
"
" show line number 
set nu

" don't backup
set nobackup

" set the width of table width 
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
"expand the tab with space 

" set the wild menu 
set wildmenu
set wildmode=longest:full,list:full


"**********************************************************
" mapping 
"**********************************************************
"
" maps with configuration file 
map <C-F10> <ESC> :source ~/.vimrc <CR>
imap <C-F10> <ESC> :source ~/.vimrc <CR>i
nmap <C-F10> <ESC> :source ~/.vimrc <CR>
vmap <C-F10> <ESC> :source ~/.vimrc <CR>
map ,ee : e ~/.vimrc <CR>

map <Up> gk 
map <Down> gj

" ++++++++++++++++++++++++++
" map for popup menu 
" ++++++++++++++++++++++++++
"
" <Enter> means accept current complete 
inoremap <expr> <CR>        pumvisible() ? "\<C-Y>" : "\<CR>"


"**********************************************************
" configuration for all plugins 
"**********************************************************

" ++++++++++++++++++++++++++
" doxygen 
" ++++++++++++++++++++++++++
set runtimepath+=$HOME/.vim/doxygenToolkit/
let g:DoxygenToolkit_briefTag_pos="<++>"
let g:DoxygenToolkit_authorName="Yaodong Tang"

" ++++++++++++++++++++++++++
" omnicppcomplete 
" ++++++++++++++++++++++++++
set runtimepath+=$HOME/.vim/omnicppcomplete/
set runtimepath+=$HOME/.vim/omnicppcomplete/after

" map for generate tags file 
map <C-F12> :! ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-F2> :make <CR>

" set tags+=$HOME/.vim/tags/c.tags
" set tags+=$HOME/.vim/tags/log4cpp.tags

let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" close the preview window after complete 
autocmd CursorMovedI * if pumvisible()==0 | pclose | endif
autocmd InsertLeave * if pumvisible()==0 | pclose | endif 



" ++++++++++++++++++++++++++
" autocomplpop 
" ++++++++++++++++++++++++++
set runtimepath+=$HOME/.vim/autocomplpop



" ++++++++++++++++++++++++++
" snipMate 
" ++++++++++++++++++++++++++
set runtimepath+=$HOME/.vim/snipMate
set runtimepath+=$HOME/.vim/snipMate/after
let g:acp_behaviorSnipmateLength = 1



" ++++++++++++++++++++++++++
" taglist 
" ++++++++++++++++++++++++++
set runtimepath+=$HOME/.vim/taglist

imap <C-F9> <ESC> :TlistToggle <CR>
nmap <C-F9> <ESC> :TlistToggle <CR>
vmap <C-F9> <ESC> :TlistToggle <CR>

let TlistHighlightTag = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Display_Tag_Scope = 0
let Tlist_Process_File_Always = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Close_On_Select = 1 
"let Tlist_Display_Prototype = 1



" ++++++++++++++++++++++++++
" cscope
" ++++++++++++++++++++++++++
"map <C-_> : cstag <C-R>=expand("<cword>")<CR><CR>

" set cscopequickfix=s-,c-,d-,i-,t-,e-
" set cscopetag           " replace the ctags with cscope 
" set cscopetagorder=0    " set the search order, cscope.out first,then tags 
" set cscoperelative      " set the path of database file as parameter of P 
" set cscopeverbose       " give the message while add database 




" ++++++++++++++++++++++++++
" winmanager 
" ++++++++++++++++++++++++++
set runtimepath+=$HOME/.vim/winmanager

map <F8> <ESC> :WMToggle <CR>

let g:winManagerWindowLayout = 'FileExplorer|TagList' 
let g:persistentBehaviour = 0   " exit if the winmanager is lonely



" ++++++++++++++++++++++++++
" vim-latexsuite 
" ++++++++++++++++++++++++++
imap <C-L> <Plug>Tex_LeftRight
"inoremap <C-I> <Plug>Tex_InsertItemOnThisLine

set runtimepath+=$HOME/.vim/latex 
set grepprg=grep\ -nH\ $*

let g:tex_flavor='latex'        " default file type 
let g:Imap_FreezeImap = 0       " whether stop imaps 
let b:Imap_FreezeImap = 0       " as above, just work on current buffer 
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode --src-specials $*'
let g:Tex_ViewRule_pdf = 'foxitReader'



" load php function list auto 
"
"set runtimepath+=$HOME/.vim/php 
"set runtimepath+=$HOME/.vim/zencoding
"au FileType php setlocal dict+=/etc/vim/php_funclist.txt

set runtimepath+=$HOME/.vim/pydiction-1.2
let g:pydiction_location='$HOME/.vim/pydiction-1.2/pydiction/complete-dict'
"set runtimepath+=$HOME/.vim/pythoncomplete/


" load file type plugin for man 
runtime ! ftplugin/man.vim

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin-1


iab lable label

set foldclose=all

" disable using mouse select text
set mouse-=a


"set runtimepath+=$HOME/.vim/trac.vim  




" some key for make
map <F2> <ESC> :wa <CR> :make <CR>
imap <F2> <ESC> :wa <CR> :make <CR>

" make clean and make
map mcam <ESC> :wa <CR> :make clean; make <CR>

map <F3> <ESC> :cn <CR>
map <F4> <ESC> :cp <CR>
map <F5> <ESC> :wa <CR> : exec "! chmod +x " . expand("%") <CR> :exec "e" <CR> :let b:buf_cmd = "! ./" . expand("%") <CR> : exec b:buf_cmd <CR>

" map key for generate typedef from head file
map <C-T> <ESC> :wa <CR> : let b:buf_cmd = "r !sed -n '/^struct/{ s=struct \\([a-z_A-Z]\\{1,\\}\\)[ \\t]*{=typedef struct \\1 \\1_t;=p};/^enum/{ s=enum \\([a-z_A-Z]\\{1,\\}\\)[ \\t]*{=typedef enum \\1 \\1_t;=p}' " .  expand("%") <CR> : exec b:buf_cmd <CR>

set runtimepath+=$HOME/.vim/vimgdb_1.2


source $HOME/.vim/viking/viking.vim

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,gb2312,big5,latin1
set termencoding=utf-8
set fileencoding=utf-8

" configuration for tasklist
set runtimepath+=$HOME/.vim/tasklist


augroup Shebang
    autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl># coding: utf-8\<nl>#\<nl># Usage: \<nl># Author: Yaodong Tang\" | $ 
    autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env bash\<nl>#\<nl># Usage: \<nl># Author: Yaodong Tang\" | $ 
    autocmd BufNewFile *.h 0put =\"/*\<nl>\tCOPYRIGHT NOTICE\<nl>\tCopyright (c) 2017, All rights Yaodong Tang reserved\<nl>\<nl>\t@Email: Yaodong Tang\<nl>\t@Description:\<nl>*/\" | $ 
    autocmd BufNewFile *.lua 0put =\"--\<nl>--\tCOPYRIGHT NOTICE\<nl>--\tCopyright (c) 2017, All rights Yaodong Tang reserved\<nl>--\<nl>--\t@Email: Yaodong Tang\<nl>--\t@Description:\<nl>--\" | $ 
    autocmd BufNewFile *.py exec 'set keywordprg=pydoc' 
augroup END


" personal configuration for each direcotry
if filereadable(".workspace.vim")
    source .workspace.vim
endif


" configuration for vim trac 
set runtimepath+=$HOME/.vim/vimtrac
set runtimepath+=$HOME/.vim/vimtrac/plugin
let g:tracServerList = {}
"let g:tracServerList['(wiki)'] = ''

" configuration for cscope 
set runtimepath+=$HOME/.vim/cscope

" configure for echofunction
let g:EchoFuncShowOnStatus=1
set statusline+=%{EchoFuncGetStatusLine()}
set runtimepath+=$HOME/.vim/echofunc/


" configure file jump
map gb <C-o>
