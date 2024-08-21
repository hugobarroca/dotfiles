syntax on
set autoindent

let g:netrw_liststyle=3

call plug#begin()

" List your plugins here
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jlcrochet/vim-cs'
Plug 'evanleck/vim-svelte'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

call plug#end()

set relativenumber
