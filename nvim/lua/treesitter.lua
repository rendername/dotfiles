require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'terraform', 'hcl', 'go', 'bash', 'python' },
    auto_install = true,
    highlight = {
        enable = true,
    },
})
