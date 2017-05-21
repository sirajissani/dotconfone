" Vim color file
" Maintainer:	Siraj Issani <siraj.issani@gmail.com>
" Last Change:	2011 December 03
" grey on black
" optimized for TFT panels

set background=dark
hi clear
if $COLORTERM == 'gnome-terminal' || $COLORTERM == 'mate-terminal'
    set t_Co=256
endif
let g:colors_name = "noblesse"

" GUI
highlight Normal            guifg=Grey80	    guibg=Black         gui=NONE
highlight Search            guifg=Black	        guibg=Red	        gui=NONE
highlight Visual            guifg=Grey10        guibg=Grey95        gui=NONE
highlight StatusLine        guifg=Grey90	    guibg=Grey30        gui=NONE
highlight StatusLineNC      guifg=Grey30	    guibg=Grey10        gui=NONE
highlight LineNr            guifg=Grey30        guibg=Black         gui=NONE
highlight VertSplit         guifg=Grey60        guibg=Grey20        gui=NONE 
highlight Cursor            guifg=Black	        guibg=#20a020       gui=NONE
highlight lCursor           guifg=Black	        guibg=#20a020       gui=NONE
highlight CursorLine        guifg=Grey10        guibg=Grey15        gui=NONE
highlight Folded            guifg=DarkCyan      guibg=Grey20        gui=italic

highlight Special           guifg=Orange                            gui=NONE
highlight Comment           guifg=#808080                           gui=italic
highlight Type              guifg=#60c060                           gui=NONE
highlight Statement         guifg=DarkYellow                        gui=NONE
highlight Constant          guifg=#c08080                           gui=NONE
highlight Identifier        guifg=Cyan                              gui=NONE
highlight PreProc           guifg=#c09040                           gui=NONE
highlight Ignore            guifg=bg                                gui=NONE
highlight Error             guifg=Red           guibg=Grey10        gui=NONE
highlight Todo              guifg=LightCyan     guibg=Grey20        gui=NONE

" syn match Braces display '[{}()\[\]]'
" highlight Braces            guifg=Blue                            gui=NONE
hi CurlyBraces  guifg=Orange
hi SquareBraces guifg=DarkCyan
hi RoundBraces  guifg=#406090

hi cCppBracket  guifg=DarkCyan
hi cCppParen    guifg=Orange

" Console
highlight Normal    ctermfg=LightGrey   ctermbg=Black
highlight Search    ctermfg=Black       ctermbg=Red     cterm=NONE
highlight Visual    ctermfg=DarkBlue     ctermbg=Grey   cterm=NONE
highlight LineNr    ctermfg=DarkGrey    ctermbg=NONE    cterm=none
highlight Cursor    ctermfg=Black       ctermbg=Green   cterm=none
highlight CursorLine  ctermfg=black     ctermbg=Black   cterm=NONE
highlight StatusLine  ctermfg=Black     ctermbg=DarkCyan    cterm=NONE
highlight StatusLineNC  ctermfg=White   ctermbg=DarkGrey    cterm=NONE
highlight Special   ctermfg=Brown
highlight Comment   ctermfg=Grey        ctermbg=Black   cterm=italic
highlight PreProc   ctermfg=DarkCyan        ctermbg=Black   cterm=NONE
highlight Statement ctermfg=DarkYellow      cterm=NONE
highlight Type      ctermfg=Green   cterm=NONE
highlight Constant  ctermfg=Magenta                           cterm=NONE

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey	ctermbg=Black	cterm=NONE	guifg=Grey80      guibg=Black	gui=NONE
    highlight Search  ctermfg=Black	ctermbg=Red	cterm=bold	guifg=Black       guibg=Red	gui=bold
    highlight Visual  ctermfg=Black	ctermbg=yellow	cterm=bold	guifg=#404040			gui=bold
    highlight Special ctermfg=LightBlue			cterm=NONE	guifg=LightBlue			gui=NONE
    highlight Comment ctermfg=Cyan			cterm=NONE	guifg=LightBlue			gui=NONE
  endif
endif

