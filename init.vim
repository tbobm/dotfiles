" Using vim-plug
set runtimepath+=~/etc/snippets
call plug#begin('~/.local/share/nvim/plugged')

" Graphical stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" - Theme
Plug 'mhartington/oceanic-next'
Plug 'ajmwagar/vim-dues'

" Git
Plug 'tpope/vim-fugitive'

" Vimwiki
Plug 'vimwiki/vimwiki'

" Syntax conf
" Plug 'vim-syntastic/syntastic'
Plug 'w0rp/ale'

" Autocompletion stuff
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" - Go
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'fatih/vim-go'

" For Js
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Snippets
Plug 'SirVer/ultisnips'
call plug#end()

" Configuration
let b:did_ftplugin = 1
" Syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ['eslint']

" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}]

set expandtab
set fileformat=unix
set autoindent

" Deoplete config
let g:deoplete#enable_at_startup = 1
" Go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#enable_at_startup = 1
" Js ?
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
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

" Snippets
let g:UltiSnipsSnippetsDir=$HOME."/etc/snippets/UltiSnip"
let g:UltiSnipsExpandTrigger="<tab>"

set wildmenu

"Graphical stuff again
colorscheme dues
set background=light
let g:airline_theme='light'
"let g:airline_theme='base16_atelierlakeside'
set nu
set noshowmode

set foldmethod=syntax
set foldlevel=99

" # Code
set encoding=utf-8
set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Undo
set undofile
set undodir=~/etc/undodir

nnoremap<space> za
nnoremap ; :
nmap <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" Tabs
" Tab navigation like Firefox." line numbering toggle
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap <C-N> :tabnew<CR>

map <leader>t :SyntasticToggleMode<CR>
map <leader>e :so $EDITOR_CONFIG<CR>

" Format
au BufRead,BufNewFile *.c,*.cpp,*.h,*.hpp,*.hh map <leader>c :ClangFormat <CR>
au BufRead,BufNewFile *.go map <leader>f :GoFull <CR>
au BufRead,BufNewFile *.go map <leader>r :GoRun %<CR>

set smartindent
set smarttab

syntax on

" filetype
filetype plugin indent on

" Complete
set completeopt=longest,menuone,preview

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
