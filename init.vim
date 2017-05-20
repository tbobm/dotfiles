" Using vim-plug
set runtimepath+=~/etc/snippets
call plug#begin('~/.local/share/nvim/plugged')

" Plugins
Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'

Plug 'vim-syntastic/syntastic'

Plug 'freeo/vim-kalisi'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" haproxy
Plug 'zimbatm/haproxy.vim'

" Colorscheme
Plug 'mhartington/oceanic-next'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }


Plug 'roxma/nvim-completion-manager'

Plug 'nvie/vim-flake8'

Plug 'tpope/vim-surround'

Plug 'rhysd/vim-clang-format'

" Code Snippets
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

" Comments
Plug 'scrooloose/nerdcommenter'

" Language
" Css
Plug 'skammer/vim-css-color'
" Python
Plug 'davidhalter/jedi-vim'

" Haskell
Plug 'neovimhaskell/haskell-vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'eagletmt/ghcmod-vim'

" Rust
Plug 'rust-lang/rust.vim'

" Vim
Plug 'dbakker/vim-lint'

" Nodejs
" Plug 'vimlab/neojs'
Plug 'pangloss/vim-javascript'
Plug 'othree/es.next.syntax.vim'

" cpp
"Plug 'zchee/deoplete-clang'

" Plug 'alfredodeza/pytest.vim'
" TODO Add cmake support @cpp/c

" Dockerfile
" Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plug 'ekalinin/Dockerfile.vim'

call plug#end()

" Configuration


" NERDComments
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

" Deoplete config
let g:deoplete#enable_at_startup = 1
" Deoplete Go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1

" Customisation based on https://github.com/mcantor/no_plugins/blob/master/no_plugins.vim

let g:UltiSnipsSnippetsDir=$HOME."/etc/snippets/UltiSnip"
" let g:UltiSnipsSnippetDirectories=["~/etc/snippets", "UltiSnips"]
set wildmenu

" Generate ctags
command! MakeTags !ctags -R .

" Colorscheme
" colorscheme kalisi
"if (has("termguicolors"))
    "set termguicolors
"endif
colorscheme OceanicNext
set background=dark

let g:airline_theme='base16_atelierlakeside'

" Pretty
set nu
set noshowmode

" Folding
set foldmethod=syntax
set foldlevel=99

" History
set undofile
set undodir=~/etc/undodir

" netrw
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" # Maps
" Allow spacebar to fold
nnoremap<space> za

let mapleader=","
set pastetoggle=<F2>
nnoremap ; :

" NERDTree toggle
map <leader><F4> :NERDTreeToggle <CR>

" Format
au BufRead,BufNewFile *.c,*.cpp,*.h,*.hpp,*.hh map <leader>c :ClangFormat <CR>
au BufRead,BufNewFile *.go map <leader>f :GoFull <CR>
au BufRead,BufNewFile *.go map <leader>r :GoRun %<CR>

" Add parenthesis
map <leader>9 ysiw)

" line numbering toggle
nmap <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" vim-fugitive
map <leader>p :Gpush <CR>

" Windows mapping
" map <C-L> <C-W>l<C-W>
" map <C-H> <C-W>h<C-W>

" Tabs
" Tab navigation like Firefox.
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>

nnoremap <C-N> :tabnew<CR>

nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap <leader>i :lprevious<CR>
nnoremap <leader>p :lnext<CR>


" # Code
set encoding=utf-8
set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.
set listchars=tab:>.,trail:.,extends:#,nbsp:.

syntax on

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
map <leader>t :SyntasticToggleMode<CR>
map <leader>e :so $EDITOR_CONFIG<CR>

" filetype
filetype plugin indent on

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<leader>b"
"let g:UltiSnipsJumpBackwardTrigger="<leader>z"

set expandtab
set fileformat=unix
set autoindent

" Python
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79

" Haskell
au BufNewFile,BufRead *.hs set
    \ softtabstop=2
    \ shiftwidth=2
    \ smartindent
    \ smarttab
    \ fileformat=unix

" HTML
au BufNewFile,BufRead *.html set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ smartindent
    \ smarttab

au BufNewFile,BufRead *.yml set
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
" au Bufenter *.hs compiler ghc

au FileType haproxy set
    \ softtabstop=2
    \ shiftwidth=2
    \ tabstop=2

" Javascript
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" User defined functions

function! PrettyJSON()
	%!python -m json.tool
endfunction

function! GlideUpdate()
        !glide --no-color update
endfunction

function! SV()
        :e $EDITOR_CONFIG
endfunction

function! GoFull()
        :GoVet
        :GoLint
endfunction

command! PrettyJSON call PrettyJSON()

command! GlideUpdate call GlideUpdate()

command! SV call SV()

command! GoFull call GoFull()
