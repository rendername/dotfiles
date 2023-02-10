vim.g.mapleader = " "

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true
vim.opt.hlsearch = false
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 50
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.opt.completeopt = 'menuone,noselect'
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", })

vim.g.NERDTreeWinSize = 40
