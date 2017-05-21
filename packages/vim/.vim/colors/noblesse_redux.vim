" Vim color file -- noblesse_redux
" Maintainer:   Chaitanya Ghone <csghone-at-gmail-com>
"               Siraj Issani <siraj.issani@gmail.com>
" Based on
"   candycode by Justin Constantino <goflyapig-at-gmail-com>
"   asu1dark  by A. Sinan Unu
"   noblesse  by Siraj Issani <siraj.issani@gmail.com>
" Last Change:  2017 Mar 9

set background=dark
highlight clear

if $COLORTERM == 'gnome-terminal' || $COLORTERM == 'mate-terminal'
    set t_Co=256
endif
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="noblesse_redux"
"let save_cpo = &cpo
"set cpo&vim

hi Normal       guifg=Grey80        guibg=Black   gui=NONE
hi Folded       guifg=DarkCyan      guibg=Grey20  gui=italic
hi LineNr       guifg=Grey30        guibg=Black   gui=NONE
hi Directory    guifg=#00bbdd       guibg=NONE    gui=NONE
hi NonText      guifg=#77ff22       guibg=NONE    gui=bold
hi SpecialKey   guifg=#559933       guibg=NONE    gui=NONE
hi SpellBad     guifg=NONE          guibg=NONE    gui=undercurl
hi SpellCap     guifg=NONE          guibg=NONE    gui=undercurl
hi SpellLocal   guifg=NONE          guibg=NONE    gui=undercurl
hi SpellRare    guifg=NONE          guibg=NONE    gui=undercurl
hi DiffAdd      guifg=#ffffff       guibg=#126493 gui=NONE
hi DiffChange   guifg=#000000       guibg=#976398 gui=NONE
hi DiffDelete   guifg=#000000       guibg=#be1923 gui=bold
hi DiffText     guifg=#ffffff       guibg=#976398 gui=bold
hi FoldColumn   guifg=#c8bcb9       guibg=#786d65 gui=bold
hi SignColumn   guifg=#c8bcb9       guibg=#786d65 gui=bold
hi Pmenu        guifg=#000000       guibg=#a6a190 gui=NONE
hi PmenuSel     guifg=#ffffff       guibg=#133293 gui=NONE
hi PmenuSbar    guifg=NONE          guibg=#555555 gui=NONE
hi PmenuThumb   guifg=NONE          guibg=#cccccc gui=NONE
hi StatusLine   guifg=Grey90        guibg=Grey30  gui=bold
hi StatusLineNC guifg=Grey30        guibg=Grey10  gui=NONE
hi WildMenu     guifg=#ffffff       guibg=#133293 gui=bold
hi VertSplit    guifg=Grey60        guibg=Grey20  gui=NONE
hi TabLine      guifg=#000000       guibg=#c2bfa5 gui=NONE
hi TabLineFill  guifg=#000000       guibg=#c2bfa5 gui=NONE
hi TabLineSel   guifg=#ffffff       guibg=#133293 gui=NONE
hi Cursor       guifg=#000000       guibg=#20a020 gui=NONE
hi CursorIM     guifg=#000000       guibg=#aaccff gui=NONE
hi CursorLine   guifg=Grey10        guibg=Grey60  gui=NONE
hi CursorColumn guifg=NONE          guibg=#1b1b1b gui=NONE
hi Visual       guifg=Grey10        guibg=Grey95  gui=NONE
hi IncSearch    guifg=#000000       guibg=#eedd33 gui=bold
hi Search       guifg=Black         guibg=Red     gui=NONE
hi MatchParen   guifg=NONE          guibg=#3377aa gui=NONE
hi ModeMsg      guifg=#eecc18       guibg=NONE    gui=NONE
hi Title        guifg=#dd4452       guibg=NONE    gui=bold
hi Question     guifg=#66d077       guibg=NONE    gui=NONE
hi MoreMsg      guifg=#39d049       guibg=NONE    gui=NONE
hi ErrorMsg     guifg=#ffffff       guibg=#ff0000 gui=bold
hi WarningMsg   guifg=#ccae22       guibg=NONE    gui=bold
hi Comment      guifg=#808080       guibg=NONE    gui=italic
hi Constant     guifg=#c08080       guibg=NONE    gui=NONE
hi Boolean      guifg=#ff6050       guibg=NONE    gui=bold
hi Identifier   guifg=Cyan          guibg=NONE    gui=NONE
hi Statement    guifg=DarkYellow    guibg=NONE    gui=NONE
hi PreProc      guifg=#c09040       guibg=NONE    gui=NONE
hi Type         guifg=#60c060       guibg=NONE    gui=NONE
hi Special      guifg=Orange        guibg=NONE    gui=NONE
hi SpecialChar  guifg=Orange        guibg=NONE    gui=NONE
hi Ignore       guifg=bg            guibg=NONE    gui=NONE
hi Error        guifg=Red           guibg=Grey10  gui=NONE
hi Todo         guifg=LightCyan     guibg=Grey20  gui=NONE
hi Underlined   guifg=#80a0ff       guibg=NONE    gui=underline


hi Normal       ctermfg=lightgray   ctermbg=black       cterm=NONE
hi Folded       ctermfg=lightgray   ctermbg=black       cterm=underline
hi LineNr       ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi Directory    ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi NonText      ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi SpecialKey   ctermfg=green       ctermbg=NONE        cterm=NONE
hi SpellBad     ctermfg=white       ctermbg=darkred     guisp=#ff0011
hi SpellCap     ctermfg=white       ctermbg=darkblue    guisp=#0044ff
hi SpellLocal   ctermfg=black       ctermbg=cyan        guisp=#00dd99
hi SpellRare    ctermfg=white       ctermbg=darkmagenta guisp=#ff22ee
hi DiffAdd      ctermfg=white       ctermbg=darkblue    cterm=NONE
hi DiffChange   ctermfg=black       ctermbg=darkmagenta cterm=NONE
hi DiffDelete   ctermfg=black       ctermbg=red         cterm=bold
hi DiffText     ctermfg=white       ctermbg=green       cterm=bold
hi FoldColumn   ctermfg=lightgray   ctermbg=darkgray    cterm=NONE
hi SignColumn   ctermfg=lightgray   ctermbg=darkgray    cterm=NONE
hi Pmenu        ctermfg=white       ctermbg=darkgray    cterm=NONE
hi PmenuSel     ctermfg=white       ctermbg=lightblue   cterm=NONE
hi PmenuSbar    ctermfg=black       ctermbg=black       cterm=NONE
hi PmenuThumb   ctermfg=gray        ctermbg=gray        cterm=NONE
hi StatusLine   ctermfg=black       ctermbg=darkcyan    cterm=NONE
hi StatusLineNC ctermfg=white       ctermbg=darkgray    cterm=NONE
hi WildMenu     ctermfg=white       ctermbg=red         cterm=bold
hi VertSplit    ctermfg=white       ctermbg=white       cterm=NONE
hi TabLine      ctermfg=black       ctermbg=white       cterm=NONE
hi TabLineFill  ctermfg=black       ctermbg=white       cterm=NONE
hi TabLineSel   ctermfg=white       ctermbg=black       cterm=NONE
hi Cursor       ctermfg=black       ctermbg=green       cterm=NONE
hi CursorIM     ctermfg=black       ctermbg=white       cterm=reverse
hi CursorLine   ctermfg=black       ctermbg=darkcyan    cterm=NONE
hi CursorColumn ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Visual       ctermfg=darkblue    ctermbg=gray        cterm=NONE
hi IncSearch    ctermfg=white       ctermbg=yellow      cterm=NONE
hi Search       ctermfg=black       ctermbg=red         cterm=NONE
hi MatchParen   ctermfg=white       ctermbg=blue        cterm=NONE
hi ModeMsg      ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Title        ctermfg=red         ctermbg=NONE        cterm=bold
hi Question     ctermfg=green       ctermbg=NONE        cterm=NONE
hi MoreMsg      ctermfg=green       ctermbg=NONE        cterm=NONE
hi ErrorMsg     ctermfg=white       ctermbg=red         cterm=bold
hi WarningMsg   ctermfg=yellow      ctermbg=NONE        cterm=bold
hi Comment      ctermfg=grey        ctermbg=black       cterm=NONE
hi Constant     ctermfg=magenta     ctermbg=NONE        cterm=NONE
hi Boolean      ctermfg=red         ctermbg=NONE        cterm=bold
hi Identifier   ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Statement    ctermfg=darkyellow  ctermbg=NONE        cterm=bold
hi PreProc      ctermfg=darkcyan    ctermbg=black       cterm=NONE
hi Type         ctermfg=green       ctermbg=NONE        cterm=bold
hi Special      ctermfg=brown       ctermbg=NONE        cterm=bold
hi SpecialChar  ctermfg=brown       ctermbg=NONE        cterm=NONE
hi Ignore       ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi Error        ctermfg=white       ctermbg=red         cterm=NONE
hi Todo         ctermfg=black       ctermbg=yellow      cterm=bold
hi Underlined   ctermfg=NONE        ctermbg=NONE        cterm=underline   term=underline

" syn match Braces display '[{}()\[\]]'
" highlight Braces  guifg=Blue gui=NONE
hi CurlyBraces  guifg=Orange
hi SquareBraces guifg=DarkCyan
hi RoundBraces  guifg=#406090

hi cCppBracket  guifg=DarkCyan
hi cCppParen    guifg=Orange

" only for vim 5
if has("unix")
  if v:version<600
    highlight Normal  ctermfg=Grey      ctermbg=Black  cterm=NONE  guifg=Grey80    guibg=Black gui=NONE
    highlight Search  ctermfg=Black     ctermbg=Red    cterm=bold  guifg=Black     guibg=Red   gui=bold
    highlight Visual  ctermfg=Black     ctermbg=yellow cterm=bold  guifg=#404040               gui=bold
    highlight Special ctermfg=LightBlue                cterm=NONE  guifg=LightBlue             gui=NONE
    highlight Comment ctermfg=Cyan                     cterm=NONE  guifg=LightBlue             gui=NONE
  endif
endif

"let &cpo = save_cpo
