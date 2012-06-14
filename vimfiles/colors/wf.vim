" Vim color file
" Maintainer:	Feng Weifeng <jpssff@gmail.com>
" Last Change:	2011-12-12

hi clear
set background=dark
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "wf"

"term
hi WideMenu         ctermfg=black      ctermbg=cyan
hi Menu         ctermfg=black      ctermbg=cyan

" gui
hi Cursor       gui=none  guifg=bg         guibg=Green
hi CursorColumn gui=none  guibg=#555555
hi CursorLine   gui=none  guibg=#555555
hi Directory    gui=none  guifg=#cc8000
hi ErrorMsg     gui=none  guifg=White      guibg=Red
hi FoldColumn   gui=none  guibg=#333333    guifg=#cccccc
hi Folded       gui=none  guibg=#333333    guifg=#40ffff
hi LineNr       gui=none  guibg=#111111    guifg=#666666
hi MatchParen   gui=none  guibg=Blue
hi Menu         gui=none  guifg=black      guibg=cyan
hi ModeMsg      gui=none  guifg=White      guibg=Blue
hi MoreMsg      gui=none  guifg=SeaGreen
hi NonText      gui=none  guifg=bg
hi Normal       gui=none  guifg=#eeeeee    guibg=black
hi Pmenu        gui=none  guibg=brown
hi Question     gui=none  guifg=Green
hi Scrollbar    gui=none  guifg=darkcyan   guibg=cyan
hi Search       gui=none  guifg=white      guibg=Red
hi SpecialKey   gui=none  guifg=#cc0000
hi StatusLine   gui=none         guifg=#000000    guibg=#dddddd
hi StatusLineNC gui=none         guifg=#111111    guibg=#999999
hi TabLine      gui=none  guifg=blue       guibg=white
hi TabLineFill  gui=none  guifg=blue       guibg=white
hi TabLineSel   gui=none  guifg=white      guibg=blue
hi Title        gui=none  guifg=Magenta
hi VertSplit    gui=reverse
hi Visual       gui=reverse
hi WarningMsg   gui=none  guifg=Red
hi Identifier   gui=none  guifg=#40ffff
hi PreProc      gui=none  guifg=#ff80ff
hi Comment      gui=none  guifg=#80a0ff
hi String       gui=none  guifg=#A6E22E
hi Constant     gui=none  guifg=#ffa0a0
hi Special      gui=none  guifg=Orange
hi Statement    gui=none  guifg=#ffff60
hi Type         gui=none  guifg=#60ff60
hi Error        gui=none  guifg=Red        guibg=Black
hi Todo         gui=none  guifg=Blue       guibg=Yellow

hi link IncSearch		Visual
hi link Character		Constant
hi link Number			Constant
hi link Boolean			Constant
hi link Float			Number
hi link Function		Identifier
hi link Conditional		Statement
hi link Repeat			Statement
hi link Label			Statement
hi link Operator		Statement
hi link Keyword			Statement
hi link Exception		Statement
hi link Include			PreProc
hi link Define			PreProc
hi link Macro			PreProc
hi link PreCondit		PreProc
hi link StorageClass	Type
hi link Structure		Type
hi link Typedef			Type
hi link Tag				Special
hi link SpecialChar		Special
hi link Delimiter		Special
hi link SpecialComment	Special
hi link Debug			Special
