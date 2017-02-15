" Using vim-plug
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'

Plug 'vim-syntastic/syntastic'

Plug 'freeo/vim-kalisi'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'Valloric/YouCompleteMe'

Plug 'nvie/vim-flake8'

Plug 'tpope/vim-surround'

Plug 'rhysd/vim-clang-format'

" Code Snippets
Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

call plug#end()

" Colorscheme
colorscheme kalisi
set background=dark

let g:airline_theme='molokai'

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

" Clang-Format
map <leader>c :ClangFormat <CR>

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

" filetype
filetype plugin indent on

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<leader>b"
let g:UltiSnipsJumpBackwardTrigger="<leader>z"

" Python
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix
