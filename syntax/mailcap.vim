let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'syntax/mailcap.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'mailcap') == -1

" Vim syntax file
" Language:	Mailcap configuration file
" Maintainer:	Doug Kearns <dougkearns@gmail.com>
" Last Change:	2013 Jun 01

if exists("b:current_syntax")
  finish
endif

syn match  mailcapComment "^#.*"

syn region mailcapString start=+"+ end=+"+ contains=mailcapSpecial oneline

syn match  mailcapDelimiter "\\\@<!;"

syn match  mailcapSpecial "\\\@<!%[nstF]"
syn match  mailcapSpecial "\\\@<!%{[^}]*}"

syn case ignore
syn match  mailcapFlag	    "\(=\s*\)\@<!\<\(needsterminal\|copiousoutput\|x-\w\+\)\>"
syn match  mailcapFieldname "\<\(compose\|composetyped\|print\|edit\|test\|x11-bitmap\|nametemplate\|textualnewlines\|description\|x-\w+\)\>\ze\s*="
syn match  mailcapTypeField "^\(text\|image\|audio\|video\|application\|message\|multipart\|model\|x-[[:graph:]]\+\)\(/\(\*\|[[:graph:]]\+\)\)\=\ze\s*;"
syn case match

hi def link mailcapComment	Comment
hi def link mailcapDelimiter	Delimiter
hi def link mailcapFlag		Statement
hi def link mailcapFieldname	Statement
hi def link mailcapSpecial	Identifier
hi def link mailcapTypeField	Type
hi def link mailcapString	String

let b:current_syntax = "mailcap"

" vim: ts=8

endif
