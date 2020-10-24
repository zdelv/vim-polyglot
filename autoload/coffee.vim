let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'autoload/coffee.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'coffee-script') == -1

" Language:    CoffeeScript
" Maintainer:  Mick Koch <mick@kochm.co>
" URL:         http://github.com/kchmck/vim-coffee-script
" License:     WTFPL

" Set up some common global/buffer variables.
function! coffee#CoffeeSetUpVariables()
  " Path to coffee executable
  if !exists('g:coffee_compiler')
    let g:coffee_compiler = 'coffee'
  endif

  " Options passed to coffee with make
  if !exists('g:coffee_make_options')
    let g:coffee_make_options = ''
  endif

  " Path to cake executable
  if !exists('g:coffee_cake')
    let g:coffee_cake = 'cake'
  endif

  " Extra options passed to cake
  if !exists('g:coffee_cake_options')
    let g:coffee_cake_options = ''
  endif

  " Path to coffeelint executable
  if !exists('g:coffee_linter')
    let g:coffee_linter = 'coffeelint'
  endif

  " Options passed to CoffeeLint
  if !exists('g:coffee_lint_options')
    let g:coffee_lint_options = ''
  endif

  " Pass the litcoffee flag to tools in this buffer if a litcoffee file is open.
  " Let the variable be overwritten so it can be updated if a different filetype
  " is set.
  if &filetype == 'litcoffee'
    let b:coffee_litcoffee = '--literate'
  else
    let b:coffee_litcoffee = ''
  endif
endfunction

function! coffee#CoffeeSetUpErrorFormat()
  CompilerSet errorformat=Error:\ In\ %f\\,\ %m\ on\ line\ %l,
                         \Error:\ In\ %f\\,\ Parse\ error\ on\ line\ %l:\ %m,
                         \SyntaxError:\ In\ %f\\,\ %m,
                         \%f:%l:%c:\ error:\ %m,
                         \%-G%.%#
endfunction

endif
