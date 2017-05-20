" Global Settings
set nocompatible       " We don't want vi compatibility.
set ttyfast
set lazyredraw
set showcmd            " Show (partial) command in status line.
set noshowmatch        " Show matching brackets.
set mouse=a            " Enable mouse usage (all modes) in terminals
set mousehide          " Hide mouse after chars typed
set encoding=utf-8     " you really should be using utf-8 now
set termencoding=utf-8 " ditto
set clipboard+=unnamed " Yanks go on clipboard instead.
set history=10000      " Number of things to remember in history.
set timeoutlen=250     " Time to wait after ESC (default causes an annoying delay)
set laststatus=2       " Always show status line.
set directory=~/.vim/
set tildeop            " Enable using tilde to swap case
set ruler              " Ruler on
set nu                 " Line numbers on
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l/%L,%c\ %)%P

" Search
set incsearch  " show 'best match so far' as you type
set nohls      " Don't highlight matches. Use :set hls when needed.
set ignorecase " ignores case of letters on searches
set smartcase  " Override 'ignorecase' if the search pattern has upper case

" Font
set guifont=mononoki\ 12,Monaco\ 11,Monospace\ 11
set guifont=mononoki\ 12,Monaco\ 11,DejaVu\ Sans\ Mono\ 11,Monospace\ 11

execute pathogen#infect()
execute pathogen#helptags()

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
"set listchars+=precedes:<,extends:>

" Filetype and Synatx Highlighting
filetype on          " Automatically detect file types
filetype indent on   " Filetype specific indentation
filetype plugin on
set fileencodings=   " don't do any encoding conversion (otherwise munges binary files)
syntax on            " Syntax Highlighting
" colorscheme selection is below

" Completion
set wildmode=longest,full
set wildignore+=*.o,*~,.lo " ignore object files
set wildmenu               " menu has tab completion

" Folds
"noremap <space> za   " Toggle folding
set foldlevel=100     " Default all folds open
set foldmethod=indent " Set foldmethod

"Set home directory
":cd ~

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gvim ~ vim
if has('gui_running')
    set guioptions-=T
    set guioptions+=g
    set guioptions+=a
    set guioptions-=t
    set guioptions+=m
    set guioptions-=L
    set guioptions-=l
    set guioptions-=r
    set guioptions-=R
endif

" Completely turn of blinking
:set guicursor+=a:blinkon0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous Tweaks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Y yanks till the end of the line
":map Y y$

" Build cscope database and ctags with CTRL+F12
":source ~/.vim/plugin/cscope_maps.vim
"map <C-F12> :!cscope_gen.sh; ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"set tags+=~/.vim/tags/cpp;./tags
let cscope_file=$HOME."/cscope.out"
if file_readable(cscope_file)
  cs reset
  cs add ~/cscope.out
endif
set tags=~/tags
set cscopequickfix=a-,s-,c-,d-,i-,t-,e-

" Dictionary for keyword i_C-X_C-K completion
set dictionary=/usr/share/dict/words
" For manpages
set keywordprg=man\ -P\ more

" AutoChange directory on switching buffers - fixed to avoid ConqueGdb failure
autocmd BufEnter * if expand("%:p:h") !~ 'Conque-Gdb.*gdb' | silent! lcd %:p:h

" Move more screenfuls at a time
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Visual Mode Swapping Goodness!
":vnoremap <C-X> <Esc>`.``gvP``P

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
map <F6> <esc>:cf<cr><esc>:copen<cr><esc><C-w>J<esc>:cf<cr>
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits
:set winminheight=0
map <C-W><C-Left> <C-W>h
map <C-W><C-Right> <C-W>l

" Zoom current window
"map <C-z> <C-W>_
" Resize window
map <C-z> <C-W><
map <C-x> <C-W>>
map <C-b> <C-W>+
map <C-n> <C-W>-

" Tabs
":map <C-t> :tabnew<CR>
":map <C-q> :tabclose<cr>
":map <C-p> :tabprevious<cr>
":map <C-n> :tabnext<cr>
"noremap <silent> <C-Left> :exe "silent! tabmove " . (tabpagenr() - 2)<CR>
"noremap <silent> <C-Right> :exe "silent! tabmove " . tabpagenr()<CR>
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

autocmd FileType python nnoremap <buffer> [[ ?^class\\|^\s*def<CR>
autocmd FileType python nnoremap <buffer> ]] /^class\\|^\s*def<CR>

"F9/10/11 -> Compile/Run/QuickfixWindow
"autocmd FileType  c,cpp   map <F9>  <esc>:w<CR>:!clear; echo Compiling %;<CR>:make %:r<CR>
"autocmd FileType  c,cpp   map <F10> <esc>:!clear; echo Running %; ./%:r<CR>
"autocmd FileType  java    map <F9>  <esc>:w<CR>:!clear; echo Compiling %; javac %<CR>
"autocmd FileType  java    map <F10> <esc>:!clear; echo Running %; java %<CR>
"autocmd FileType  python  map <F10> <esc>:!clear; echo Running %; python %<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
:let NERDTreeWinPos="left"
:let NERDTreeWinSize=35
nmap <silent> E :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
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


map <C-Left> b
map <C-Right> e

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

"set listchars=tab:➝\ ,space:·,trail:·
set listchars=tab:»\ ,nbsp:\ ,trail:»

set list

"Hack for color consistency
if $COLORTERM == 'gnome-terminal' || $COLORTERM == 'mate-terminal'
    set t_Co=256
endif


colorscheme noblesse
"colorscheme csg
"colorscheme candycode
"colorscheme asu1dark
"colorscheme torte
"colorscheme spring-night
"colorscheme wombat256

"unmap <cr>
imap <C-Right> <esc>ea
imap <C-Left> <esc>bi

autocmd FileType  c,cpp,h,hpp,cxx   setlocal cc=81 | setlocal shiftwidth=2 | setlocal tabstop=2 | setlocal softtabstop=2 | set noic
autocmd FileType  python            setlocal cc=81 | set noic
autocmd FileType  conque_term       setlocal nolist

let g:jedi#force_py_version = 3
let g:neocomplete#enable_at_startup = 1

nmap <Leader>z <Plug>(easymotion-sn)
nmap <Leader>t <Plug>(easymotion-next)
nmap <Leader>T <Plug>(easymotion-prev)


