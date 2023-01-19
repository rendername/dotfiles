vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- themes
  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'EdenEast/nightfox.nvim'
  use 'ThePrimeagen/harpoon'
end)

require('telescope').setup {
  fzf = {
    fuzzy = true
  }
}

require('telescope').load_extension('fzf')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Tab spacing
vim.o.tabstop=4
vim.o.softtabstop=0
vim.o.softtabstop=0

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.swapfile = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]
--vim.cmd [[colorscheme nightfox]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Telescope mappings
vim.keymap.set('n', '<leader>tf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>th', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>tw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>tg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>td', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>tb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })

vim.keymap.set('n', '<leader>n', function () require('telescope.builtin').find_files({cwd = '~/vimwiki/'}) end, { desc = 'Search notes' })
vim.keymap.set('n', '<leader>s', function () require('telescope.builtin').find_files({cwd = '~/.config/scripts'}) end, { desc = 'Search scripts' })

vim.keymap.set('n', '<leader>i', ':e ~/.config/nvim/init.lua<cr>', { desc = 'open init.lua' })

vim.keymap.set('n', '<leader>hh', require("harpoon.ui").toggle_quick_menu, { desc = 'toggle harpoon ui' })
vim.keymap.set('n', '<leader>ha', require("harpoon.mark").toggle_file, { desc = 'toggle harpoon mark' })
