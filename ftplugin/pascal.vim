let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'ftplugin/pascal.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'pascal') == -1

" Vim filetype plugin file
" Language:	pascal
" Maintainer:	Dan Sharp <dwsharp at users dot sourceforge dot net>
" Last Changed: 11 Apr 2011
" URL:		http://dwsharp.users.sourceforge.net/vim/ftplugin

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

if exists("loaded_matchit")
    let b:match_ignorecase = 1 " (pascal is case-insensitive)

    let b:match_words = '\<\%(begin\|case\|record\|object\|try\)\>'
    let b:match_words .= ':\<^\s*\%(except\|finally\)\>:\<end\>'
    let b:match_words .= ',\<repeat\>:\<until\>'
    let b:match_words .= ',\<if\>:\<else\>'
endif

" Undo the stuff we changed.
let b:undo_ftplugin = "unlet! b:match_words"

endif
