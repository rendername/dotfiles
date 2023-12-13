let mapleader = " "
let g:vimwiki_url_maxsave = 0
let g:ranger_map_keys = 0 " turn off ranger default mapping
let g:repos_dir = '~/repos'

set tabstop=4
set number
set relativenumber
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
set completeopt=menuone,longest

syntax on
filetype plugin on

colorscheme codedark
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]

autocmd TerminalOpen * setlocal nobuflisted
