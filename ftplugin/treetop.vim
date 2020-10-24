let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'ftplugin/treetop.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'treetop') == -1

" Vim filetype plugin file
" Language:             Treetop
" Previous Maintainer:  Nikolai Weibull <now@bitwi.se>
" Latest Revision:      2011-03-14

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

setlocal comments=b:# commentstring=#\ %s formatoptions-=tcroq formatoptions+=l

let b:undo_ftplugin = "setl com< cms< fo<"

let &cpo = s:cpo_save
unlet s:cpo_save

endif
