let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'ftplugin/meson.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'meson') == -1

" Vim filetype plugin file
" Language:	meson
" License:	VIM License
" Original Author:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
" Last Change:		2018 Nov 27

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1
let s:keepcpo= &cpo
set cpo&vim

setlocal commentstring=#\ %s
setlocal comments=:#

setlocal shiftwidth=2
setlocal softtabstop=2

let &cpo = s:keepcpo
unlet s:keepcpo

endif
