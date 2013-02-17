filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()


Bundle 'gmarik/vundle'

Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on

colorscheme desert
filetype plugin indent on
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

set shiftwidth=2
set cin
set ai
set softtabstop=2
set ic

set gfn=DejaVu\ Sans\ Mono\ 11

