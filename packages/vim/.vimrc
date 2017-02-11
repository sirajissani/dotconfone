" Global Settings
set nocompatible       " We don't want vi compatibility.
set ttyfast
set lazyredraw
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set mouse=a            " Enable mouse usage (all modes) in terminals
set mousehide          " Hide mouse after chars typed
set encoding=utf-8     " you really should be using utf-8 now
set termencoding=utf-8 " ditto
set clipboard+=unnamed " Yanks go on clipboard instead.
set history=10000      " Number of things to remember in history.
set timeoutlen=250     " Time to wait after ESC (default causes an annoying delay)
set laststatus=2       " Always show status line.
set directory=~/.vim/
set tildeop            "Enable using tilde to swap case
set ruler              " Ruler on
set nu                 " Line numbers on
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l/%L,%c\ %)%P

" Search
set incsearch  " show 'best match so far' as you type
set nohls      " Don't highlight matches. Use :set hls when needed.
set ignorecase " ignores case of letters on searches
set smartcase  " Override 'ignorecase' if the search pattern has upper case

" Font
set guifont=Monaco\ 9,Monospace\ 9
set guifont=DejaVu\ Sans\ Mono\ 9,Monospace\ 9

" Tabs and Indentation
set expandtab
set smarttab
set smartindent   " smart indent of code - indent after opening '{',
set autoindent    " Copy indent from current line when starting a new line
set shiftwidth=4  " Number of spaces to use for each step of (auto)indent
set tabstop=4     " Number of spaces that a <Tab> in the file counts for.
set softtabstop=4 " Backspace the proper number of spaces
set shiftround    " Round indent to multiple of 'shiftwidth'

" Wrapping
set wrap
set sidescroll=5
set listchars+=precedes:<,extends:>

" Filetype and Synatx Highlighting
filetype on          " Automatically detect file types
filetype indent on   " Filetype specific indentation
filetype plugin on
set fileencodings=   " don't do any encoding conversion (otherwise munges binary files)
syntax on            " Syntax Highlighting
" set t_Co=256       " xterm
set background="dark" 
colorscheme torte

" Completion
set wildmode=longest,full
set wildignore+=*.o,*~,.lo " ignore object files
set wildmenu               " menu has tab completion

" Folds
noremap <space> za    " Toggle folding
set foldlevel=100     " Default all folds open
set foldmethod=indent " Set foldmethod

"Set home directory
:cd ~

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim ~ vim
if has('gui_running')
    set guioptions-=T
    set guioptions+=g
    set guioptions+=a
    set guioptions-=t
    set guioptions-=m
    set guioptions-=L
    set guioptions-=l
    set guioptions-=r
    set guioptions-=R
    colorscheme ir_black
endif

" Completely turn of blinking
:set guicursor+=a:blinkon0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous Tweaks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Y yanks till the end of the line
:map Y y$

" Build cscope database and ctags with CTRL+F12
:source ~/.vim/plugin/cscope_maps.vim
map <C-F12> :!cscope_gen.sh; ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
set tags+=~/.vim/tags/cpp;./tags

" Dictionary for keyword i_C-X_C-K completion 
set dictionary=/usr/share/dict/words
" For manpages
set keywordprg=man\ -P\ more

" AutoChange directory on switching buffers
autocmd BufEnter * lcd %:p:h 

" Move more screenfuls at a time
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Visual Mode Swapping Goodness!
:vnoremap <C-X> <Esc>`.``gvP``P

" Edit the vimrc files easily
:nmap ,es :source ~/.vimrc<CR>
:nmap ,ev :e ~/.vimrc<CR>

" visual shifting (builtin-repeat)
:vnoremap < <gv
:vnoremap > >gv

" :TOhtml
let html_number_lines=1
let html_use_css=1
let use_xhtml=1

" Quickfix Window
map <F11> <esc>:copen<cr> 
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits
:set winminheight=0
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Zoom current window
map <C-z> <C-W>_

" Tabs
:map <C-t> :tabnew<CR>
:map <C-q> :tabclose<cr>
:map <C-p> :tabprevious<cr>
:map <C-n> :tabnext<cr>
noremap <silent> <C-Left> :exe "silent! tabmove " . (tabpagenr() - 2)<CR>
noremap <silent> <C-Right> :exe "silent! tabmove " . tabpagenr()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comments are not placed in the first column.
" They stay at their current indent level
inoremap # #

" C Indentation options: K&R Style
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent

" Tex flavor := Latex
let g:tex_flavor='latex'

" Python formatting
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Highlight the methodnames in C++
function! EnhanceCppSyntax()
  syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
  hi def link cppFuncDef Special
endfunction
autocmd Syntax cpp call EnhanceCppSyntax()

"F9/10/11 -> Compile/Run/QuickfixWindow
autocmd FileType  c,cpp   map <F9>  <esc>:w<CR>:!clear; echo Compiling %;<CR>:make %:r<CR>
autocmd FileType  c,cpp   map <F10> <esc>:!clear; echo Running %; ./%:r<CR>
autocmd FileType  java    map <F9>  <esc>:w<CR>:!clear; echo Compiling %; javac %<CR>
autocmd FileType  java    map <F10> <esc>:!clear; echo Running %; java %<CR>
autocmd FileType  python  map <F10> <esc>:!clear; echo Running %; python %<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
:let NERDTreeWinPos="right"
:let NERDTreeWinSize=30
nmap <silent> <F8> :NERDTreeToggle<CR>
" Don't autostart
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" FuzzyFinder
let g:fuf_modesDisable = []
nmap ,fb :FufBuffer<CR>
nmap ,ff :FufFile<CR>
nmap ,fd :FufDir<CR>
nmap ,fr :FufMruFile<CR>
nmap ,fc :FufMruCmd<CR>
nmap ,ft :FufTag<CR>

" Taglist
nmap <silent> <F7> :TlistToggle<CR>
let Tlist_Use_Right_Window=0
let Tlist_Auto_Open=0
let Tlist_Enable_Fold_Column=0
let Tlist_Compact_Format=0
let Tlist_WinWidth=28
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1
