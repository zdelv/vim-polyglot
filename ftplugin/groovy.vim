let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'ftplugin/groovy.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'groovy') == -1

" Vim filetype plugin file
" Language:	groovy
" Maintainer:	Justin M. Keyes <justinkz@gmail.com>
" Last Change:	2016 May 22

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo-=C

let b:undo_ftplugin = 'setlocal commentstring<'

setlocal commentstring=//%s

let &cpo = s:cpo_save
unlet s:cpo_save

endif
