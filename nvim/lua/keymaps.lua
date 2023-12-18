vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
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
vim.keymap.set('n', '<leader>t', ':cd ~/tmp<CR>', { noremap = true})

vim.keymap.set('n', '<leader>gg', function()
    local fzf_lua = require('fzf-lua')
    fzf_lua.live_grep({prompt = 'Grep> '})
end)

vim.keymap.set('n', '<leader>i', function()
    local fzf_lua = require('fzf-lua')
    fzf_lua.files({cwd='~/.config/nvim'})
end, { noremap = true })

vim.keymap.set('n', '<leader>c', function()
    vim.cmd('cd ~/.config/nvim', {})
    local fzf_lua = require('fzf-lua')
    fzf_lua.files({cwd='~/.config/nvim'})
end, { noremap = true })

vim.keymap.set('n', '<leader>b', function()
    local fzf_lua = require('fzf-lua')
    fzf_lua.buffers()
end, { noremap = true})
