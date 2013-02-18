filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()


Bundle 'gmarik/vundle'

Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on

colorscheme desert
set nowrap
syntax enable
set background=dark
set syntax=on

noremap <C-T> <Esc>:CommandT<CR>

let g:clang_complete_copen=1
let g:clang_use_library=1
let g:clang_library_path='/usr/lib/llvm/'
let g:clang_complete_macros=1
let g:clang_complete_auto=0
let g:clang_auto_select=1

set shiftwidth=4
set cin
set ai
set softtabstop=4
set ic
set expandtab

set gfn=DejaVu\ Sans\ Mono\ 11
set backspace=start,eol,indent

set cinoptions=:0,l1,g0,(0,W1s,m1
set hlsearch
set list
set listchars=tab:>-,trail:@

