" Using vim-plug
set runtimepath+=~/etc/snippets
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'

Plug 'vim-syntastic/syntastic'

Plug 'freeo/vim-kalisi'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'Valloric/YouCompleteMe'
" Autocomplete
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

Plug 'roxma/nvim-completion-manager'

Plug 'nvie/vim-flake8'

Plug 'tpope/vim-surround'

Plug 'rhysd/vim-clang-format'

" Code Snippets
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

" Language
" Haskell
Plug 'neovimhaskell/haskell-vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'eagletmt/ghcmod-vim'

" Rust
Plug 'rust-lang/rust.vim'

" Plug 'alfredodeza/pytest.vim'
" TODO Add cmake support @cpp/c

" Dockerfile
" Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plug 'ekalinin/Dockerfile.vim'

call plug#end()

" Customisation based on https://github.com/mcantor/no_plugins/blob/master/no_plugins.vim

let g:UltiSnipsSnippetsDir=$HOME."/etc/snippets/UltiSnip"
" let g:UltiSnipsSnippetDirectories=["~/etc/snippets", "UltiSnips"]
set wildmenu

" Generate ctags
command! MakeTags !ctags -R .


" Colorscheme
colorscheme kalisi
set background=dark

let g:airline_theme='base16_atelierlakeside'

" Pretty
set nu
set noshowmode

" Folding
set foldmethod=syntax
set foldlevel=99

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

" au Bufenter *.hs compiler ghc

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
