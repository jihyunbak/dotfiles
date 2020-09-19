" this is .vimrc for JHB
" to source this config, in a VIM editor do `:so ~/.vimrc`
" comment starts with a double quote, and should not have a closing quote

" Useful resources:
" https://realpython.com/vim-and-python-a-match-made-in-heaven/#vim-extensions

" ===== general editing =====

" Use four (4) spaces instead of a tab
set tabstop=4
set shiftwidth=4
set expandtab

" line numbering
set nu

" ===== code folding =====

" Enable folding
set foldmethod=indent
"set foldmethod=manual
"set foldmethod=syntax
set foldlevel=99
"set foldcolumn=2

" Enable folding with the spacebar
nnoremap <space> za

" ===== syntax =====

syntax on

let python_highlight_all=1
"let markdown_fold=1
let g:markdown_folding=1
let g:markdown_enable_folding=1

" Python specific - setting to follow PEP 8 standards
au BufNewFile,BufRead *.py
    \ set textwidth=79

" auto-indent (start a newline at matching indentation)
au BufNewFile,BufRead *.py,*md
    \ set autoindent

" use Unix (\n) line endings
au BufNewFile,BufRead *.py
    \ set fileformat=unix


" Markdown specific
"au BufNewFile,BufFilePre,BufRead *.md
"    \ set foldmethod=manual


" ===== color schemes =====

set background=dark

colorscheme slate
"colorscheme atom-dark

