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

vim.keymap.set('n', '<leader>e', ':Ranger<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tt', ':hor term<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vt', ':vert term<CR>', { noremap = true })
vim.keymap.set('n', '<leader>so', ':so %<CR> :echo "reloaded file"<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ff', (function() require('fzf-lua').files() end), { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-j>', ':move +1<CR>', { noremap = true })
vim.keymap.set('n', '<C-k>', ':move -2<CR>', { noremap = true })
vim.keymap.set('n', '<C-n>', ':bn<CR>', { noremap = true })
vim.keymap.set('n', '<C-p>', ':bp<CR>', { noremap = true })

vim.keymap.set('n', '<leader>i', function()
    local fzf_lua = require('fzf-lua')
    fzf_lua.files({cwd='~/.config/nvim'})
end, { noremap = true })
