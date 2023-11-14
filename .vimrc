let mapleader = " "

set tabstop=4
set number
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
nnoremap <leader>w :e ~/vimwiki/index.md<CR>
nnoremap <leader>s :Explore ~/.config/scripts<CR>
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

"quote strings
nnoremap <leader>' viwA'<esc>Bi'<esc>E
nnoremap <leader>" viwA"<esc>Bi"<esc>E

syntax on
filetype plugin on

call plug#begin()
    Plug 'vimwiki/vimwiki'
    Plug 'tomasiser/vim-code-dark'
    Plug 'hashivim/vim-terraform'
    Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme codedark
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]
