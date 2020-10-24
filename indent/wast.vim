let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'indent/wast.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'wast') == -1

" Vim indent file
" Language:     WebAssembly
" Maintainer:   rhysd <lin90162@yahoo.co.jp>
" Last Change:  Jul 29, 2018
" For bugs, patches and license go to https://github.com/rhysd/vim-wasm

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" WebAssembly text format is S-expression. We can reuse LISP indentation
" logic.
setlocal indentexpr=lispindent('.')
setlocal noautoindent nosmartindent

let b:undo_indent = "setl lisp< indentexpr<"

endif
