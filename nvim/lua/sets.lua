vim.g.mapleader = " "
vim.g.repos_dir = "~/repos"
vim.g.ranger_map_keys = 0 -- turn off ranger default mapping

vim.opt.tabstop=4
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.breakindent=true
vim.opt.undofile=true
vim.opt.undodir='/home/anthony/tmp/vimundo'
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.updatetime=50
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.path=vim.opt.path+'**/*'
vim.opt.wildmenu=true
vim.opt.wrap=false
vim.cmd 'colorscheme codedark'
