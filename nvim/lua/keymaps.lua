vim.keymap.set('n', '<leader>tt', ':term<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vt', ':vert term<CR>', { noremap = true })
vim.keymap.set('n', '<leader>st', ':hor term<CR>', { noremap = true })
vim.keymap.set('n', '<leader>so', ':so %<CR> :echo "reloaded file"<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ff', (function() require('telescope.builtin').find_files() end), { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-j>', ':move +1<CR>', { noremap = true })
vim.keymap.set('n', '<C-k>', ':move -2<CR>', { noremap = true })
vim.keymap.set('n', '<C-p>', ':bp<CR>', { noremap = true })
vim.keymap.set('n', '<C-n>', ':bn<CR>', { noremap = true })
vim.keymap.set('n', '<leader>n', ':e ~/vimwiki/index.md<CR>', { noremap = true})
vim.keymap.set('n', '<leader>r', ':bd!<CR>', { noremap = true})
vim.keymap.set('n', '<leader>cc', ':e ~/.aws/config<CR>', { noremap = true})


vim.keymap.set('n', '<leader>dd', function()
    vim.diagnostic.open_float()
end, { noremap = true})

--visual
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true })

vim.keymap.set('n', '<leader>s', function()
    local telescope = require('telescope.builtin')
    telescope.find_files({cwd='~/.config/scripts'})
end, { noremap = true })

vim.keymap.set('n', '<leader>gg', function()
    local telescope = require('telescope.builtin')
    telescope.live_grep()
end)

vim.keymap.set('n', '<leader>i', function()
    local telescope = require('telescope.builtin')
    telescope.find_files({cwd='~/.config/nvim'})
end, { noremap = true })

vim.keymap.set('n', '<leader>c', function()
    vim.cmd('cd ~/.config/nvim', {})
    local telescope = require('telescope.builtin')
    telescope.find_files({cwd='~/.config/nvim'})
end, { noremap = true })

vim.keymap.set('n', '<leader>b', function()
    local telescope = require('telescope.builtin')
    telescope.buffers()
end, { noremap = true})

vim.keymap.set('n', '<leader>w', function()
    local telescope = require('telescope.builtin')
    telescope.find_files({cwd='~/vimwiki'})
end, { noremap = true})

vim.keymap.set('n', '<leader>e', ':Telescope file_browser<CR>', { noremap = true })
