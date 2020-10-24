let s:base = expand("<sfile>:h:h")
let Filter = { _, v -> stridx(v, s:base) == -1 && stridx(v, $VIMRUNTIME) == -1 && v !~ "after" }
let files = filter(globpath(&rtp, 'syntax/yats/dom-node.vim', 1, 1), Filter)
if len(files) > 0
  exec 'source ' . files[0]
  finish
endif
if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'typescript') == -1

syntax keyword typescriptDOMNodeProp contained attributes baseURI baseURIObject childNodes
syntax keyword typescriptDOMNodeProp contained firstChild lastChild localName namespaceURI
syntax keyword typescriptDOMNodeProp contained nextSibling nodeName nodePrincipal
syntax keyword typescriptDOMNodeProp contained nodeType nodeValue ownerDocument parentElement
syntax keyword typescriptDOMNodeProp contained parentNode prefix previousSibling textContent
syntax cluster props add=typescriptDOMNodeProp
if exists("did_typescript_hilink") | HiLink typescriptDOMNodeProp Keyword
endif
syntax keyword typescriptDOMNodeMethod contained appendChild cloneNode compareDocumentPosition nextgroup=typescriptFuncCallArg
syntax keyword typescriptDOMNodeMethod contained getUserData hasAttributes hasChildNodes nextgroup=typescriptFuncCallArg
syntax keyword typescriptDOMNodeMethod contained insertBefore isDefaultNamespace isEqualNode nextgroup=typescriptFuncCallArg
syntax keyword typescriptDOMNodeMethod contained isSameNode isSupported lookupNamespaceURI nextgroup=typescriptFuncCallArg
syntax keyword typescriptDOMNodeMethod contained lookupPrefix normalize removeChild nextgroup=typescriptFuncCallArg
syntax keyword typescriptDOMNodeMethod contained replaceChild setUserData nextgroup=typescriptFuncCallArg
syntax match typescriptDOMNodeMethod contained /contains/
syntax cluster props add=typescriptDOMNodeMethod
if exists("did_typescript_hilink") | HiLink typescriptDOMNodeMethod Keyword
endif
syntax keyword typescriptDOMNodeType contained ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE
syntax keyword typescriptDOMNodeType contained CDATA_SECTION_NODEN_NODE ENTITY_REFERENCE_NODE
syntax keyword typescriptDOMNodeType contained ENTITY_NODE PROCESSING_INSTRUCTION_NODEN_NODE
syntax keyword typescriptDOMNodeType contained COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE
syntax keyword typescriptDOMNodeType contained DOCUMENT_FRAGMENT_NODE NOTATION_NODE
if exists("did_typescript_hilink") | HiLink typescriptDOMNodeType Keyword
endif

endif
