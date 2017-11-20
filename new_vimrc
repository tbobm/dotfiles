call plug#begin("~/.vim/plugged")


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'maralla/completor.vim'

Plug 'w0rp/ale'

Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-sensible'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'altercation/vim-colors-solarized'


call plug#end()

colorscheme solarized

set nu
set noshowmode

set tabstop=4
set shiftwidth=4
set expandtab

filetype plugin on

let g:completor_clang_binary="/usr/bin/clang"

let mapleader=","
map ; :
nnoremap <C-n> :tabnew<CR>
nnoremap tk :tabprev<CR>
nnoremap tj :tabnext<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <leader>f :FZF<CR>
