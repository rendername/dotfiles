vim.cmd [[
call plug#begin()
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'tomasiser/vim-code-dark'
    Plug 'hashivim/vim-terraform'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'akai54/2077.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'mbbill/undotree'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'folke/which-key.nvim'

    " stuff for lsp
    Plug 'vonheikemen/lsp-zero.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'l3mon4d3/LuaSnip'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'rafamadriz/friendly-snippets'
    Plug 'theprimeagen/harpoon', {'branch': 'harpoon2'}
    Plug 'nvim-telescope/telescope-file-browser.nvim'
call plug#end()
]]
