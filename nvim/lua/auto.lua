vim.api.nvim_create_augroup('terminal', { clear = true })
vim.api.nvim_create_autocmd({'TermOpen'}, {
    group = 'terminal',
    pattern = '*',
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.cmd ':normal a'
        vim.api.nvim_buf_set_keymap(0, 't', '<C-w>', '<C-\\><C-N>', { noremap = true })
    end
})

--vim.api.nvim_create_augroup('hcl', { clear = true })
--vim.api.nvim_create_autocmd({'BufWritePre'}, {
--    group = 'hcl',
--    pattern = '*.hcl',
--    callback = function()
--
--    end
--})
