" reykjavik.vim
" Vim colorscheme based on the reykjavik Emacs theme
" Converted manually by ChatGPT

if version < 700
  finish
endif

set background=dark

" Define the color palette (copied from the Emacs theme)
let s:bg1 = "#112328"
let s:bg2 = "#243539"
let s:bg3 = "#37464a"
let s:bg4 = "#4a585c"

let s:fg1 = "#b1b1b1"
let s:fg2 = "#a3a3a3"
let s:fg3 = "#959595"
let s:fg4 = "#878787"

let s:builtin  = "#c4cbee"
let s:keyword  = "#a3d4e8"
let s:const    = "#a3d6cc"
let s:comment  = "#5d5d5d"
let s:func     = "#f1c1bd"
let s:str      = "#e6c2db"
let s:type     = "#c1d2b1"
let s:var      = "#e1c9aa"
let s:warning  = "#e81050"
let s:warning2 = "#e86310"

" Clear any existing highlights and reset syntax
highlight clear
syntax reset

let g:colors_name = "reykjavik"

" Basic highlight groups mapping:

" Normal text
execute 'highlight Normal guifg=' . s:fg1 . ' guibg=' . s:bg1

" Comments
execute 'highlight Comment guifg=' . s:comment . ' gui=italic'

" Constants
execute 'highlight Constant guifg=' . s:const

" Functions
execute 'highlight Function guifg=' . s:func

" Keywords
execute 'highlight Keyword guifg=' . s:keyword . ' gui=bold'

" Strings
execute 'highlight String guifg=' . s:str

" Types
execute 'highlight Type guifg=' . s:type

" Identifiers / Variables
execute 'highlight Identifier guifg=' . s:var

" Warnings / Errors
execute 'highlight WarningMsg guifg=' . s:warning . ' guibg=' . s:bg2

" Visual selection
execute 'highlight Visual guifg=' . s:bg1 . ' guibg=' . s:fg1

" CursorLine highlighting
execute 'highlight CursorLine guibg=' . s:bg2

" StatusLine (active and inactive)
execute 'highlight StatusLine guifg=' . s:fg4 . ' guibg=' . s:bg2 . ' gui=bold'
execute 'highlight StatusLineNC guifg=' . s:var . ' guibg=' . s:bg1

" Line numbers
execute 'highlight LineNr guifg=' . s:fg4 . ' guibg=' . s:bg1
execute 'highlight CursorLineNr guifg=' . s:fg1 . ' guibg=' . s:bg1 . ' gui=bold'

" Search highlighting
execute 'highlight Search guifg=' . s:warning . ' guibg=' . s:bg3
execute 'highlight IncSearch guifg=' . s:warning . ' guibg=' . s:bg3

" Matching parentheses
execute 'highlight MatchParen guibg=' . s:warning

" Vertical split
execute 'highlight VertSplit guifg=' . s:fg3 . ' guibg=' . s:bg1

" Tab line (if using GUI tabline plugins)
execute 'highlight TabLine guifg=' . s:fg2 . ' guibg=' . s:bg1
execute 'highlight TabLineSel guifg=' . s:fg1 . ' guibg=' . s:bg4 . ' gui=bold'

" Popup menu (e.g., for completion)
execute 'highlight Pmenu guifg=' . s:fg2 . ' guibg=' . s:bg1
execute 'highlight PmenuSel guifg=' . s:fg3 . ' guibg=' . s:bg3

" Underlined text (links, etc.)
execute 'highlight Underlined guifg=' . s:const . ' gui=underline'
