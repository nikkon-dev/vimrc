set nocompatible
filetype off

let no_flake8_maps=1

" Utils {{{
source ~/.vim/functions/util.vim
" }}}

" Load external configuration before anything else {{{
if filereadable(expand("~/.vim/before.vimrc"))
  source ~/.vim/before.vimrc
endif
" }}}

let mapleader = ","
let maplocalleader = "\\"

" Local vimrc configuration {{{
let s:localrc = expand($HOME . '/.vim/local.vimrc')
if filereadable(s:localrc)
    exec ':so ' . s:localrc
endif
" }}}

" PACKAGE LIST {{{
" Use this variable inside your local configuration to declare
" which package you would like to include
if ! exists('g:vimified_packages')
    let g:vimified_packages = ['general', 'fancy', 'os', 'coding', 'python', 'ruby', 'html', 'css', 'js', 'clojure', 'haskell', 'color']
endif
" }}}

" VUNDLE {{{
let s:bundle_path=$HOME."/.vim/bundle/"
execute "set rtp+=".s:bundle_path."vundle/"
call vundle#rc()

Bundle 'gmarik/vundle'
" }}}

" PACKAGES {{{

" Install user-supplied Bundles {{{
let s:extrarc = expand($HOME . '/.vim/extra.vimrc')
if filereadable(s:extrarc)
    exec ':so ' . s:extrarc
endif
" }}}

" _. General {{{
if count(g:vimified_packages, 'general')


    Bundle 'scrooloose/nerdtree'
    " nmap <C-n> :NERDTreeToggle<CR>
    let NERDTreeChDirMode=2
    let NERDTreeQuitOnOpen=1
    nmap <Tab> :NERDTreeFind<CR>
    " Disable the scrollbars (NERDTree)
    set guioptions-=r
    set guioptions-=L


    Bundle 'michaeljsmith/vim-indent-object'
    let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

    Bundle 'troydm/easybuffer.vim'
    nmap <leader>be :EasyBufferToggle<enter>

endif
" }}}

" _. Fancy {{{
if count(g:vimified_packages, 'fancy')
    call g:Check_defined('g:airline_left_sep', '')
    call g:Check_defined('g:airline_right_sep', '')
    call g:Check_defined('g:airline_branch_prefix', '')

    Bundle 'bling/vim-airline'
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
    let g:airline_branch_prefix = '⭠'
    let g:airline_readonly_symbol = '⭤'
    let g:airline_linecolumn_prefix = '⭡'
endif
" }}}

" _. Coding {{{

if count(g:vimified_packages, 'coding')
    Bundle 'majutsushi/tagbar'
    nmap <leader>t :TagbarToggle<CR>

    autocmd FileType gitcommit set tw=68 spell
    Bundle 'git://github.com/Valloric/YouCompleteMe.git'
    Bundle 'nvie/vim-flake8'
    Bundle 'scrooloose/syntastic'
    let g:syntastic_python_checkers=['flake8']
    let g:syntastic_cpp_checkers=['gcc']

    Bundle 'joonty/vdebug.git'
endif
" }}}

" _. Color {{{
if count(g:vimified_packages, 'color')
    Bundle 'sjl/badwolf'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'tomasr/molokai'
    Bundle 'zaiste/Atom'
    Bundle 'w0ng/vim-hybrid'
    Bundle 'chriskempson/base16-vim'
    Bundle 'Elive/vim-colorscheme-elive'
    Bundle 'zeis/vim-kolor'
endif
    colorscheme default
" }}}

" }}}

" General {{{
filetype plugin indent on
let g:hybrid_use_Xresources = 1
syntax on
set mouse=
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_extra_conf_globlist = ['/place/home/nikkon/sources/.ycm_extra_conf.py']
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
cscope add ~/sources/cscope.out
set cst
set csto=0
set path+=/home/nikkon/sources/arcadia
set path+=/home/nikkon/sources/build-rel
set path+=/home/nikokn/sources/build-dev

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Set 5 lines to the cursor - when moving vertically
set scrolloff=0

" This orders Vim to open the buffer.
set switchbuf=useopen

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" Mappings {{{


" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>

" better ESC
inoremap jk <Esc>
" }}}


" Settings {{{
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,l1,g0,(0,W1s,m1
set completeopt=menuone,preview
set encoding=utf-8
set hidden
set history=1000
set incsearch
set laststatus=2
set listchars=tab:>-,trail:@
set list
set gfn=DejaVu\ Sans\ Mono\ for\ Powerline
let g:Powerline_symbols='fancy'
highlight PMenuSel ctermbg=Green ctermfg=Black
highlight PMenu ctermbg=DarkGrey ctermfg=White
set tags=/home/nikkon/sources/tags


" Don't redraw while executing macros
set nolazyredraw

" Disable the macvim toolbar
set guioptions-=T

set notimeout
set ttimeout
set ttimeoutlen=10

" _ backups {{{
if has('persistent_undo')
  set undodir=~/.vim/tmp/undo//     " undo files
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile
" _ }}}

set modelines=0
set noeol
set nu
set numberwidth=5
set ruler
set showcmd

set exrc
set secure

set matchtime=2

set completeopt=longest,menuone,preview

" White characters {{{
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set formatoptions=qrn1
" }}}

set visualbell
set vb t_vb="

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

set dictionary=/usr/share/dict/words
" }}}

" Triggers {{{

" Save when losing focus
au FocusLost    * :silent! wall
"
" When vimrc is edited, reload it
autocmd! BufWritePost vimrc source ~/.vimrc

" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
    au InsertEnter * set nocursorline
    au InsertLeave * set cursorline
augroup END
" }}}

" Trailing whitespace {{{

" Remove trailing whitespaces when saving
" Wanna know more? http://vim.wikia.com/wiki/Remove_unwanted_spaces
" If you want to remove trailing spaces when you want, so not automatically,
" see
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Display_or_remove_unwanted_whitespace_with_a_script.
autocmd BufWritePre * :%s/\s\+$//e

" }}}

" . searching {{{


set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Don't jump when using * for search
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" }}}

" Navigation & UI {{{

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" more natural movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" }}}

" . folding {{{

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

" }}}

" Quick editing {{{

" --------------------

set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1

" showmarks
let g:showmarks_enable = 1
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr

" }}}

" _ Vim {{{
augroup ft_vim
    au!

    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" EXTENSIONS {{{

" _. Buffer Handling {{{
source ~/.vim/functions/buffer_handling.vim
" }}}


" }}}

" TEXT OBJECTS {{{

" Shortcut for [] motion
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[

" }}}

" Load addidional configuration (ie to overwrite shorcuts) {{{
if filereadable(expand("~/.vim/after.vimrc"))
  source ~/.vim/after.vimrc
endif
" }}}

set bg=dark
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set cursorline
set cc=100
"colorscheme desert
let g:pep8_map=''
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
let g:PyFlakeDefaultComplexity=7
nnoremap <F7> :SyntasticCheck<CR>
nmap ]l :lnext<CR>
nmap [l :lprev<CR>
map <C-K> :pyf /home/nikkon/sources/llvm/tools/clang/tools/clang-format/clang-format.py<CR>
imap <C-K> <ESC>:pyf /home/nikkon/sources/llvm/tools/clang/tools/clang-format/clang-format.py<CR>i
vmap <C-K> :pyf /home/nikkon/sources/llvm/tools/clang/tools/clang-format/clang-format.py<CR>

""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif

" GO LANG
if exists("g:did_load_filetypes")
  filetype off
"  filetype plugin indent off
endif
set runtimepath+=/home/nikkon/go/misc/vim " replace $GOROOT with the output of: go env GOROOT
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go autocmd BufWritePre <buffer> retab
autocmd FileType go compiler go
autocmd FileType go set expandtab
"filetype plugin indent on
syntax on

function! EnsureMongoDBPath(mongoPath)
    let l:param_mongo_path=resolve(a:mongoPath)
    let l:cur_buffer_path=resolve(expand('<afile>:p:h'))
    let l:env_path=&path
    python <<endpython
import vim, os
from collections import OrderedDict
cur_buf_path = vim.eval('l:cur_buffer_path')
mongo_path = vim.eval('l:param_mongo_path')
cur_env_path = vim.eval('l:env_path')
if cur_buf_path.startswith(mongo_path):
    path_parts = OrderedDict.fromkeys(cur_env_path.split(',')).keys()
    if mongo_path in path_parts:
        path_parts.remove(mongo_path)
    path_parts.insert(0, mongo_path)
    vim.command('let l:new_path="%s"' % ','.join(str(p) for p in path_parts))
endpython

    if exists('l:new_path')
        execute "set path=".escape(l:new_path, ' ')
    endif
endfunction

autocmd BufRead *.cpp,*.h,*.c,*.hpp  call EnsureMongoDBPath('/home/nikkon/sources/mongo/src') |
    \ call EnsureMongoDBPath('/home/nikkon/sources/mongo/src/mongo')

autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
