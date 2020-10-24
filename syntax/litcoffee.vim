let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'syntax/litcoffee.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'coffee-script') == -1

" Language:   Literate CoffeeScript
" Maintainer: Michael Smith <michael@diglumi.com>
" URL:        https://github.com/mintplant/vim-literate-coffeescript
" License:    MIT

if exists('b:current_syntax') && b:current_syntax == 'litcoffee'
  finish
endif

syn include @markdown syntax/markdown.vim
syn include @coffee syntax/coffee.vim

" Partition the file into notCoffee and inlineCoffee. Each line will match
" exactly one of these regions. notCoffee matches with a zero-width
" look-behind.
syn region notCoffee start='^\%(    \|\t\)\@<!' end='$' contains=@markdown
syn region inlineCoffee start='^    \|\t' end='$' contains=@coffee

" We defined notCoffee as a region so we can highlight every element in it
" that doesn't have it's own explicit rule.
highlight default link notCoffee Comment

let b:current_syntax = "litcoffee"

endif
