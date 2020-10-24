let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'syntax/slpspi.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'slpspi') == -1

" Vim syntax file
" Language:             RFC 2614 - An API for Service Location SPI file
" Previous Maintainer:  Nikolai Weibull <now@bitwi.se>
" Latest Revision:      2006-04-19

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn keyword slpspiTodo          contained TODO FIXME XXX NOTE

syn region  slpspiComment       display oneline start='^[#;]' end='$'
                                \ contains=slpspiTodo,@Spell

syn match   slpspiBegin         display '^'
                                \ nextgroup=slpspiKeyType,
                                \ slpspiComment skipwhite

syn keyword slpspiKeyType       contained PRIVATE PUBLIC
                                \ nextgroup=slpspiString skipwhite

syn match   slpspiString        contained '\S\+'
                                \ nextgroup=slpspiKeyFile skipwhite

syn match   slpspiKeyFile       contained '\S\+'

hi def link slpspiTodo          Todo
hi def link slpspiComment       Comment
hi def link slpspiKeyType       Type
hi def link slpspiString        Identifier
hi def link slpspiKeyFile       String

let b:current_syntax = "slpspi"

let &cpo = s:cpo_save
unlet s:cpo_save

endif
