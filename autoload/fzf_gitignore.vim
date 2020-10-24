let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'autoload/fzf_gitignore.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'gitignore') == -1

scriptencoding utf-8

" Copyright (c) 2017-2020 Filip Szymański. All rights reserved.
" Use of this source code is governed by an MIT license that can be
" found in the LICENSE file.

function! s:template_sink(templates) abort
  try
    let l:lines = _fzf_gitignore_create(a:templates)
  catch /^Vim(\(let\|return\)):/
    return
  endtry

  new
  setlocal filetype=gitignore

  call setline(1, l:lines)

  $-2,$delete _
  normal! gg
endfunction

function! fzf_gitignore#run() abort
  try
    let l:opts = {
          \ 'source': _fzf_gitignore_get_all_templates(),
          \ 'sink*': function('s:template_sink'),
          \ 'options': '-m --prompt="Template> " --header="gitignore.io"'
          \ }
  catch /^Vim(\(let\|return\)):/
    return
  endtry

  call fzf#run(fzf#wrap(l:opts))
endfunction

" vim: ts=2 et sw=2

endif
