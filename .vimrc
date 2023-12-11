let mapleader = " "
let g:vimwiki_url_maxsave = 0

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

nnoremap <leader>i :e ~/.vimrc<CR>
nnoremap <leader>e :Lex<CR>
nnoremap <leader>tt :term<CR>
nnoremap <leader>vt :vert term<CR>
nnoremap <leader>so :so %<CR> :echo "reloaded file"<CR>
nnoremap <leader>w :e ~/vimwiki/index.md<CR>
nnoremap <leader>s :Explore ~/.config/scripts<CR>
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <leader>d :call Choose_repo_dir()<CR>
nnoremap <C-j> :move +1<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <C-k> :move -2<CR>
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

syntax on
filetype plugin on

call plug#begin()
    Plug 'vimwiki/vimwiki'
    Plug 'tomasiser/vim-code-dark'
    Plug 'hashivim/vim-terraform'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'jremmen/vim-ripgrep'
call plug#end()

colorscheme codedark
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]

command! -nargs=0 Nums :call Nums()
function Nums()
    if &number == 1
        let &number = 0
    else
        let &number = 1
    endif
    let &relativenumber = &number
endfunction

function Choose_repo_dir()
    let repo_dir = '/home/anthony/repos'
    let repo_list = systemlist('ls '.repo_dir)
    let selection = fzf#run(#{source: repo_list})

    if len(selection) == 0
        return   
    endif

    let path = repo_dir.'/'.selection[0]
    execute 'cd '.path
    echo 'navigated to: '.path
endfunction

command! -nargs=0 Dir :call Dir()
function Dir()
    " TODO: allow args to pass in a path to start at our current dir if none
    " i.e. Dir(../../) could allow us to choose from all dirs two dirs up
    let current_dir = getcwd()
    let dirs = systemlist('git ls-files | xargs -n 1 dirname | sort | uniq')
    let selection = fzf#run(#{source: dirs})

    if len(selection) == 0
        return   
    endif
    
    execute 'cd '.selection[0]
    echo 'navigated to: '.selection[0]
endfunction

autocmd TerminalOpen * setlocal nobuflisted
