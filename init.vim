" Using vim-plug
set runtimepath+=~/etc/snippets
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'

Plug 'vim-syntastic/syntastic'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Vimwiki
Plug 'vimwiki/vimwiki'
call plug#end()
