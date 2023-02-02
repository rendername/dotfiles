vim.g.mapleader = " "

-- Tab spacing
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

-- Set highlight on search
vim.opt.hlsearch = false

-- Make line numbers default
vim.opt.relativenumber = true

vim.opt.swapfile = false

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.signcolumn = 'yes'

-- Set colorscheme
vim.opt.termguicolors = true
--
-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'
