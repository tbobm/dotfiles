" Using vim-plug
set runtimepath+=~/etc/snippets
call plug#begin('~/.local/share/nvim/plugged')

" Graphical stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" - Theme
Plug 'mhartington/oceanic-next'

" Git
Plug 'tpope/vim-fugitive'

" Vimwiki
Plug 'vimwiki/vimwiki'

" Syntastic conf
Plug 'vim-syntastic/syntastic'

" Autocompletion stuff
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" - Go
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" For Js
"Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Snippets
Plug 'SirVer/ultisnips'
call plug#end()

" Configuration

" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}]


" Deoplete config
let g:deoplete#enable_at_startup = 1
" Go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1

" Snippets
let g:UltiSnipsSnippetsDir=$HOME."/etc/snippets/UltiSnip"

set wildmenu

"Graphical stuff again
colorscheme OceanicNext
set background=dark
let g:airline_theme='base16_atelierlakeside'
set nu
set noshowmode

set foldmethod=syntax
set foldlevel=99

" Undo
set undofile
set undodir=~/etc/undodir
