set nocompatible	" required
filetype off		" required
"the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

Plugin 'tmhedberg/SimpylFold'
" Allows to see Doctstring in folded code
let g:SimpylFold_docstring_preview=1

" Code
set encoding=utf-8

" Python
" Linting (pep8)
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Custom Python Indentation
Plugin 'vim-scripts/indentpython.vim'

" Uneceessary whitespaces
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

Plugin 'Valloric/YouCompleteMe'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntax Highlighting
Plugin 'scrooloose/syntastic'

" Lint Highlighting
Plugin 'nvie/vim-flake8'

let python_highlight_all=1
syntax on


" Web
" Linting (basic)
au BufNewFile,BufRead *.js, *.html, *.css set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" Color Schemes
" Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" Logic linked to Color Schemes
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" Toggle solarized background
call togglebg#map("<F5>")

" NERDTree
Plugin 'scrooloose/nerdtree'

" Plugin 'jistr/vim-nerdtree-tabs'

" Ignore .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Line Numbering
set nu

" Git commands inside vim
Plugin 'tpope/vim-fugitive'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Markdown
Plugin 'tpope/vim-markdown'

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Docker
Plugin 'ekalinin/dockerfile.vim'

" Golang
Plugin 'fatih/vim-go'

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
