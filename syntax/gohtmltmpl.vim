let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'syntax/gohtmltmpl.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'go') == -1

if exists("b:current_syntax")
  finish
endif

if !exists("g:main_syntax")
  let g:main_syntax = 'html'
endif

runtime! syntax/gotexttmpl.vim
runtime! syntax/html.vim
unlet b:current_syntax

syn cluster htmlPreproc add=gotplAction,goTplComment

let b:current_syntax = "gohtmltmpl"

" vim: sw=2 ts=2 et

endif
