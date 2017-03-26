" Vim color file -- csg
" Maintainer:   Chaitanya Ghone <csghone-at-gmail-com>
" Based on
"   candycode by Justin Constantino <goflyapig-at-gmail-com>
"   asu1dark by A. Sinan Unu
" Last Change:  2017 Mar 9

set background=dark
highlight clear

if exists("syntax_on")
    syntax reset
endif
let g:colors_name="csg"
"let save_cpo = &cpo
"set cpo&vim

hi Normal       guifg=#ffffff guibg=#050505 gui=NONE
hi Folded       guifg=#c2bfa5 guibg=#050505 gui=underline
hi LineNr       guifg=#928c75 guibg=NONE    gui=NONE
hi Directory    guifg=#00bbdd guibg=NONE    gui=NONE
hi NonText      guifg=#77ff22 guibg=NONE    gui=bold
hi SpecialKey   guifg=#559933 guibg=NONE    gui=NONE
hi SpellBad     guifg=NONE    guibg=NONE    gui=undercurl
hi SpellCap     guifg=NONE    guibg=NONE    gui=undercurl
hi SpellLocal   guifg=NONE    guibg=NONE    gui=undercurl
hi SpellRare    guifg=NONE    guibg=NONE    gui=undercurl
hi DiffAdd      guifg=#ffffff guibg=#126493 gui=NONE
hi DiffChange   guifg=#000000 guibg=#976398 gui=NONE
hi DiffDelete   guifg=#000000 guibg=#be1923 gui=bold
hi DiffText     guifg=#ffffff guibg=#976398 gui=bold
hi FoldColumn   guifg=#c8bcb9 guibg=#786d65 gui=bold
hi SignColumn   guifg=#c8bcb9 guibg=#786d65 gui=bold
hi Pmenu        guifg=#000000 guibg=#a6a190 gui=NONE
hi PmenuSel     guifg=#ffffff guibg=#133293 gui=NONE
hi PmenuSbar    guifg=NONE    guibg=#555555 gui=NONE
hi PmenuThumb   guifg=NONE    guibg=#cccccc gui=NONE
hi StatusLine   guifg=#ffffff guibg=#336600 gui=bold
hi StatusLineNC guifg=#000000 guibg=#cccccc gui=NONE
hi WildMenu     guifg=#ffffff guibg=#133293 gui=bold
hi VertSplit    guifg=#c2bfa5 guibg=#c2bfa5 gui=NONE
hi TabLine      guifg=#000000 guibg=#c2bfa5 gui=NONE
hi TabLineFill  guifg=#000000 guibg=#c2bfa5 gui=NONE
hi TabLineSel   guifg=#ffffff guibg=#133293 gui=NONE
hi Cursor       guifg=#000000 guibg=#ffff99 gui=NONE
hi CursorIM     guifg=#000000 guibg=#aaccff gui=NONE
hi CursorLine   guifg=NONE    guibg=#1b1b1b gui=NONE
hi CursorColumn guifg=NONE    guibg=#1b1b1b gui=NONE
hi Visual       guifg=#ffffff guibg=#606070 gui=NONE
hi IncSearch    guifg=#000000 guibg=#eedd33 gui=bold
hi Search       guifg=#efefd0 guibg=#937340 gui=NONE
hi MatchParen   guifg=NONE    guibg=#3377aa gui=NONE
hi ModeMsg      guifg=#eecc18 guibg=NONE    gui=NONE
hi Title        guifg=#dd4452 guibg=NONE    gui=bold
hi Question     guifg=#66d077 guibg=NONE    gui=NONE
hi MoreMsg      guifg=#39d049 guibg=NONE    gui=NONE
hi ErrorMsg     guifg=#ffffff guibg=#ff0000 gui=bold
hi WarningMsg   guifg=#ccae22 guibg=NONE    gui=bold
hi Comment      guifg=#ff9922 guibg=NONE    gui=NONE
hi Constant     guifg=#ff6050 guibg=NONE    gui=NONE
hi Boolean      guifg=#ff6050 guibg=NONE    gui=bold
hi Identifier   guifg=#eecc44 guibg=NONE    gui=NONE
hi Statement    guifg=#66d077 guibg=NONE    gui=bold
hi PreProc      guifg=#bb88dd guibg=NONE    gui=NONE
hi Type         guifg=#4093cc guibg=NONE    gui=bold
hi Special      guifg=#9999aa guibg=NONE    gui=bold
hi Ignore       guifg=#888888 guibg=NONE    gui=NONE
hi Error        guifg=#ffffff guibg=#ff0000 gui=NONE
hi Todo         guifg=#ffffff guibg=#ee7700 gui=bold
hi Underlined   guifg=#80a0ff guibg=NONE    gui=underline

hi Statement    term=BOLD cterm=BOLD ctermfg=DarkBlue    ctermbg=Black
hi Special      term=NONE cterm=NONE ctermfg=DarkGreen   ctermbg=Black
hi SpecialChar  term=NONE cterm=NONE ctermfg=Cyan        ctermbg=Black
hi Comment      term=NONE cterm=NONE ctermfg=DarkGray    ctermbg=Black
hi Preproc      term=NONE cterm=NONE ctermfg=DarkGreen   ctermbg=Black
hi Type         term=NONE cterm=NONE ctermfg=DarkMagenta ctermbg=Black
hi Identifier   term=NONE cterm=NONE ctermfg=Cyan        ctermbg=Black

hi Normal       ctermfg=white       ctermbg=black       cterm=NONE
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
hi StatusLine   ctermfg=yellow      ctermbg=darkblue    cterm=bold
hi StatusLineNC ctermfg=black       ctermbg=gray        cterm=NONE
hi WildMenu     ctermfg=white       ctermbg=red         cterm=bold
hi VertSplit    ctermfg=white       ctermbg=white       cterm=NONE
hi TabLine      ctermfg=black       ctermbg=white       cterm=NONE
hi TabLineFill  ctermfg=black       ctermbg=white       cterm=NONE
hi TabLineSel   ctermfg=white       ctermbg=black       cterm=NONE
hi Cursor       ctermfg=black       ctermbg=white       cterm=NONE
hi CursorIM     ctermfg=black       ctermbg=white       cterm=reverse
hi CursorLine   ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi CursorColumn ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Visual       ctermfg=white       ctermbg=lightblue   cterm=NONE
hi IncSearch    ctermfg=white       ctermbg=yellow      cterm=NONE
hi Search       ctermfg=white       ctermbg=darkgreen   cterm=NONE
hi MatchParen   ctermfg=white       ctermbg=blue        cterm=NONE
hi ModeMsg      ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Title        ctermfg=red         ctermbg=NONE        cterm=bold
hi Question     ctermfg=green       ctermbg=NONE        cterm=NONE
hi MoreMsg      ctermfg=green       ctermbg=NONE        cterm=NONE
hi ErrorMsg     ctermfg=white       ctermbg=red         cterm=bold
hi WarningMsg   ctermfg=yellow      ctermbg=NONE        cterm=bold
hi Comment      ctermfg=brown       ctermbg=NONE        cterm=NONE
hi Constant     ctermfg=66CC00      ctermbg=NONE        cterm=NONE
hi Boolean      ctermfg=red         ctermbg=NONE        cterm=bold
hi Identifier   ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Statement    ctermfg=green       ctermbg=NONE        cterm=bold
hi PreProc      ctermfg=darkmagenta ctermbg=NONE        cterm=NONE
hi Type         ctermfg=lightblue   ctermbg=NONE        cterm=bold
hi Special      ctermfg=lightgray   ctermbg=NONE        cterm=bold
hi Ignore       ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi Error        ctermfg=white       ctermbg=red         cterm=NONE
hi Todo         ctermfg=black       ctermbg=yellow      cterm=bold
hi Underlined   ctermfg=NONE        ctermbg=NONE        cterm=underline   term=underline


"let &cpo = save_cpo
