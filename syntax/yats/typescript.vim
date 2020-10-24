let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'syntax/yats/typescript.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'typescript') == -1

syntax keyword typescriptGlobal containedin=typescriptIdentifierName Function Boolean
syntax keyword typescriptGlobal containedin=typescriptIdentifierName Error EvalError
syntax keyword typescriptGlobal containedin=typescriptIdentifierName InternalError
syntax keyword typescriptGlobal containedin=typescriptIdentifierName RangeError ReferenceError
syntax keyword typescriptGlobal containedin=typescriptIdentifierName StopIteration
syntax keyword typescriptGlobal containedin=typescriptIdentifierName SyntaxError TypeError
syntax keyword typescriptGlobal containedin=typescriptIdentifierName URIError Date
syntax keyword typescriptGlobal containedin=typescriptIdentifierName Float32Array
syntax keyword typescriptGlobal containedin=typescriptIdentifierName Float64Array
syntax keyword typescriptGlobal containedin=typescriptIdentifierName Int16Array Int32Array
syntax keyword typescriptGlobal containedin=typescriptIdentifierName Int8Array Uint16Array
syntax keyword typescriptGlobal containedin=typescriptIdentifierName Uint32Array Uint8Array
syntax keyword typescriptGlobal containedin=typescriptIdentifierName Uint8ClampedArray
syntax keyword typescriptGlobal containedin=typescriptIdentifierName ParallelArray
syntax keyword typescriptGlobal containedin=typescriptIdentifierName ArrayBuffer DataView
syntax keyword typescriptGlobal containedin=typescriptIdentifierName Iterator Generator
syntax keyword typescriptGlobal containedin=typescriptIdentifierName Reflect Proxy
syntax keyword typescriptGlobal containedin=typescriptIdentifierName arguments
if exists("did_typescript_hilink") | HiLink typescriptGlobal Structure
endif
syntax keyword typescriptGlobalMethod containedin=typescriptIdentifierName eval uneval nextgroup=typescriptFuncCallArg
syntax keyword typescriptGlobalMethod containedin=typescriptIdentifierName isFinite nextgroup=typescriptFuncCallArg
syntax keyword typescriptGlobalMethod containedin=typescriptIdentifierName isNaN parseFloat nextgroup=typescriptFuncCallArg
syntax keyword typescriptGlobalMethod containedin=typescriptIdentifierName parseInt nextgroup=typescriptFuncCallArg
syntax keyword typescriptGlobalMethod containedin=typescriptIdentifierName decodeURI nextgroup=typescriptFuncCallArg
syntax keyword typescriptGlobalMethod containedin=typescriptIdentifierName decodeURIComponent nextgroup=typescriptFuncCallArg
syntax keyword typescriptGlobalMethod containedin=typescriptIdentifierName encodeURI nextgroup=typescriptFuncCallArg
syntax keyword typescriptGlobalMethod containedin=typescriptIdentifierName encodeURIComponent nextgroup=typescriptFuncCallArg
syntax cluster props add=typescriptGlobalMethod
if exists("did_typescript_hilink") | HiLink typescriptGlobalMethod Structure
endif

endif
