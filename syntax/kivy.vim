let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'syntax/kivy.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'kivy') == -1

" Vim syntax file
" Language:    Kivy
" Maintainer:  Corey Prophitt <prophitt.corey@gmail.com>
" Last Change: May 29th, 2014
" Version:     1
" URL:         http://kivy.org/

if exists("b:current_syntax")
    finish
endif

" Load Python syntax first (Python can be used within Kivy)
syn include @pyth $VIMRUNTIME/syntax/python.vim

" Kivy language rules can be found here
"   http://kivy.org/docs/guide/lang.html

" Define Kivy syntax
syn match kivyPreProc   /#:.*/
syn match kivyComment   /#.*/
syn match kivyRule      /<\I\i*\(,\s*\I\i*\)*>:/
syn match kivyAttribute /\<\I\i*\>/ nextgroup=kivyValue

syn region kivyValue start=":" end=/$/  contains=@pyth skipwhite

syn region kivyAttribute matchgroup=kivyIdent start=/[\a_][\a\d_]*:/ end=/$/ contains=@pyth skipwhite

hi def link kivyPreproc   PreProc
hi def link kivyComment   Comment
hi def link kivyRule      Function
hi def link kivyIdent     Statement
hi def link kivyAttribute Label

let b:current_syntax = "kivy"

" vim: ts=8

endif
