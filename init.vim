" Using vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'

Plug 'vim-syntastic/syntastic'

Plug 'freeo/vim-kalisi'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Valloric/YouCompleteMe'

Plug 'nvie/vim-flake8'

call plug#end()

" Colorscheme
colorscheme kalisi
set background=light

let g:airline_theme='molokai'

" Pretty
set nu
set noshowmode

" Folding
set foldmethod=indent
set foldlevel=99

" # Maps
" Allow spacebar to fold
nnoremap <space> za

let mapleader=","
set pastetoggle=<F2>
nnoremap ; :

" NERDTree toggle
map <leader><F4> :NERDTreeToggle <CR>

" vim-fugitive
map <leader>c :Gcommit <CR>
map <leader>p :Gpush <CR>

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

"YouCompleteMe
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" filetype
filetype plugin indent on

" Python
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix


