" Vim color file
" Maintainer:	Siraj Issani <siraj.issani@gmail.com>
" Last Change:	2011 December 03
" grey on black
" optimized for TFT panels

set background=dark
hi clear
colorscheme default
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
highlight CursorLine                            guibg=Grey15        gui=NONE
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
highlight Normal     ctermfg=LightGrey	ctermbg=Black
highlight Search     ctermfg=Black	ctermbg=Red	cterm=NONE
highlight Visual					cterm=reverse
highlight Cursor     ctermfg=Black	ctermbg=Green	cterm=bold
highlight StatusLine ctermfg=blue	ctermbg=white
highlight Special    ctermfg=Brown
highlight Comment    ctermfg=Blue
highlight Statement  ctermfg=Yellow			cterm=NONE
highlight Type						cterm=NONE

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

