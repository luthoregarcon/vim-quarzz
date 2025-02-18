"Name: quarzz.vim
"Version: 0.0.1
"Maintainer: github.com/seventwogth
"License: The MIT License (MIT)
"
"""

hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name = 'quarzz'

let s:black           = { "gui": "#000000", "cterm": "232" }
let s:medium_gray     = { "gui": "#767676", "cterm": "243" }
let s:white           = { "gui": "#F1F1F1", "cterm": "15"  }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231" }
let s:subtle_black    = { "gui": "#121212", "cterm": "233" }
let s:light_black     = { "gui": "#262626", "cterm": "235" }
let s:lighter_black   = { "gui": "#4E4E4E", "cterm": "239" }
let s:light_gray      = { "gui": "#A8A8A8", "cterm": "248" }
let s:lighter_gray    = { "gui": "#C6C6C6", "cterm": "251" }
let s:lightest_gray   = { "gui": "#EEEEEE", "cterm": "255" }
let s:dark_pink       = { "gui": "#E86181", "cterm": "204" }
let s:light_pink      = { "gui": "#FF73A0", "cterm": "168" }
let s:dark_red        = { "gui": "#FF4F7E", "cterm": "1"   }
let s:light_red       = { "gui": "#FF7177", "cterm": "1"   }
let s:orange          = { "gui": "#E04F00", "cterm": "167" }
let s:darker_blue     = { "gui": "#5D50C8", "cterm": "18"  }
let s:dark_blue       = { "gui": "#8B7FF1", "cterm": "32"  }
let s:blue            = { "gui": "#7B8CF6", "cterm": "12"  }
let s:light_blue      = { "gui": "#9CAFFF", "cterm": "153" }
let s:dark_cyan       = { "gui": "#74C7EC", "cterm": "6"   }
let s:light_cyan      = { "gui": "#89DCEB", "cterm": "14"  }
let s:dark_green      = { "gui": "#10A778", "cterm": "2"   }
let s:light_green     = { "gui": "#A6E3A1", "cterm": "47"  }
let s:light_purple    = { "gui": "#CBA6F7", "cterm": "140" }
let s:lighter_purple  = { "gui": "#C5A8F8", "cterm": "140" }
let s:vibrant_purple  = { "gui": "#6A12FF", "cterm": "57"  }
let s:yellow          = { "gui": "#FFFF43", "cterm": "11"  }
let s:light_yellow    = { "gui": "#FFFF7E", "cterm": "228" }
let s:dark_yellow     = { "gui": "#EEED0A", "cterm": "3"   }

let s:background = &background

if &background == "dark"
  let s:bg              = s:black
  let s:bg_subtle       = s:lighter_black
  let s:bg_very_subtle  = s:subtle_black
  let s:norm            = s:lighter_gray
  let s:norm_subtle     = s:medium_gray
  let s:pink            = s:light_pink
  let s:cyan            = s:light_cyan
  let s:green           = s:light_green
  let s:red             = s:dark_red
  let s:visual          = s:lighter_purple
  let s:yellow          = s:light_yellow
else
  let s:bg              = s:actual_white
  let s:bg_subtle       = s:light_gray
  let s:bg_very_subtle  = s:lightest_gray
  let s:norm            = s:light_black
  let s:norm_subtle     = s:medium_gray
  let s:pink            = s:dark_pink
  let s:cyan            = s:dark_cyan
  let s:green           = s:dark_green
  let s:red             = s:dark_red
  let s:visual          = s:lighter_purple
  let s:yellow          = s:dark_yellow
endif

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
   execute "set background=" . s:background
endif

call s:h("Cursor",        {"bg": s:light_purple, "fg": s:norm })
call s:h("Comment",       {"fg": s:bg_subtle, "gui": "italic"})

call s:h("Constant",      {"fg": s:light_purple})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

"call s:h("Identifier",    {"fg": s:dark_blue})
hi! link Identifier       Normal
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:norm_subtle})
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:h("Operator",      {"fg": s:norm, "cterm": "bold", "gui": "bold"})

call s:h("PreProc",     {"fg": s:norm_subtle})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:norm_subtle})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:norm_subtle, "gui": "italic"})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:actual_white, "bg": s:vibrant_purple, "cterm": "bold"})
call s:h("Todo",          {"fg": s:light_purple, "gui": "underline", "cterm": "underline"})
call s:h("SpecialKey",    {"fg": s:light_purple})
call s:h("NonText",       {"fg": s:medium_gray})
call s:h("Directory",     {"fg": s:light_purple})
call s:h("ErrorMsg",      {"fg": s:light_purple})
call s:h("IncSearch",     {"bg": s:light_purple, "fg": s:light_black})
call s:h("Search",        {"bg": s:light_purple, "fg": s:light_black})
call s:h("MoreMsg",       {"fg": s:medium_gray, "cterm": "bold", "gui": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bg_subtle})
call s:h("CursorLineNr",  {"fg": s:light_purple, "bg": s:bg_very_subtle})
call s:h("Question",      {"fg": s:light_purple})
call s:h("StatusLine",    {"bg": s:bg_very_subtle})
call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:medium_gray})
call s:h("VertSplit",     {"bg": s:bg_very_subtle, "fg": s:bg_very_subtle})
call s:h("Title",         {"fg": s:darker_blue})
call s:h("Visual",        {"fg": s:norm, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:bg_subtle})
call s:h("WarningMsg",    {"fg": s:light_purple})
call s:h("WildMenu",      {"fg": s:bg, "bg": s:norm})
call s:h("Folded",        {"fg": s:medium_gray})
call s:h("FoldColumn",    {"fg": s:bg_subtle})
call s:h("DiffAdd",       {"fg": s:light_purple})
call s:h("DiffDelete",    {"fg": s:vibrant_purple})
call s:h("DiffChange",    {"fg": s:light_purple})
call s:h("DiffText",      {"fg": s:darker_blue})
call s:h("SignColumn",    {"fg": s:light_purple})


if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:vibrant_purple})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:norm_subtle})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:light_purple})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:norm})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:vibrant_purple})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:norm_subtle})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:light_purple})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:norm})
endif

call s:h("Pmenu",         {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("PmenuSel",      {"fg": s:subtle_black, "bg": s:light_purple})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("TabLineSel",    {"fg": s:subtle_black, "bg": s:pink, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_very_subtle})
call s:h("CursorColumn",  {"bg": s:bg_very_subtle})
call s:h("CursorLine",    {"bg": s:bg_very_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:norm})
call s:h("qfLineNr",      {"fg": s:medium_gray})

call s:h("Keyword",       {"fg": s:vibrant_purple})
call s:h("Type",          {"fg": s:norm_subtle})

call s:h("htmlH1",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH2",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH3",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH4",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH5",        {"bg": s:bg, "fg": s:norm})
call s:h("htmlH6",        {"bg": s:bg, "fg": s:norm})

" Syntastic
call s:h("SyntasticWarningSign",    {"fg": s:light_purple})
call s:h("SyntasticWarning",        {"bg": s:light_purple, "fg": s:black, "gui": "bold", "cterm": "bold"})
call s:h("SyntasticErrorSign",      {"fg": s:vibrant_purple})
call s:h("SyntasticError",          {"bg": s:vibrant_purple, "fg": s:white, "gui": "bold", "cterm": "bold"})

" which-key.nvim
call s:h("WhichKey",                {"bg": s:bg, "fg": s:light_purple, "gui": "bold", "cterm": "bold"})
call s:h("WhichKeyDesc",            {"bg": s:bg, "fg": s:norm_subtle, "gui": "bold", "cterm": "bold"})
call s:h("WhichKeySeparator",       {"bg": s:bg, "fg": s:norm, "gui": "bold", "cterm": "bold"})
call s:h("WhichKeyFloat",           {"bg": s:bg})

hi link WhichKeyGroup WhichKey

" Neomake
hi link NeomakeWarningSign	SyntasticWarningSign
hi link NeomakeErrorSign	SyntasticErrorSign

" ALE
hi link ALEWarningSign	SyntasticWarningSign
hi link ALEErrorSign	SyntasticErrorSign

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr

"TreeSitter config
call s:h("TSFunction", {"fg": s:light_purple})
call s:h("TSKeyword", {"fg": s:vibrant_purple})
call s:h("TSString", {"fg": s:norm_subtle})
call s:h("TSVariable", {"fg": s:norm_subtle})
call s:h("TSConstant", {"fg": s:light_purple})
call s:h("TSOperator", {"fg": s:norm_subtle})
