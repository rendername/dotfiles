let mapleader = " "

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nohlsearch
set noswapfile
set breakindent
set undofile
set undodir="~/tmp/vimundo"
set ignorecase
set smartcase
set updatetime=50
set splitbelow
set splitright
set path+=**/*
set wildmenu

nnoremap <leader>i :e ~/.vimrc<CR>
nnoremap <leader>e :Lex<CR>
nnoremap <leader>tt :term<CR>
nnoremap <leader>vt :vert term<CR>
nnoremap <leader>so :so %<CR> :echo "reloaded file"<CR>
nnoremap <leader>n :e ~/vimwiki/index.md<CR>
nnoremap <leader>s :Explore ~/.config/scripts<CR>
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

call plug#begin()
    Plug 'tomasiser/vim-code-dark'
call plug#end()

colorscheme codedark
