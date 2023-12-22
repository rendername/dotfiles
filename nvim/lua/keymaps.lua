vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>tt', ':hor term<CR>', { noremap = true })
vim.keymap.set('n', '<leader>vt', ':vert term<CR>', { noremap = true })
vim.keymap.set('n', '<leader>so', ':so %<CR> :echo "reloaded file"<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ff', (function() require('fzf-lua').files() end), { noremap = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.keymap.set('n', '<C-j>', ':move +1<CR>', { noremap = true })
vim.keymap.set('n', '<C-k>', ':move -2<CR>', { noremap = true })
vim.keymap.set('n', '<C-p>', ':bp<CR>', { noremap = true })
vim.keymap.set('n', '<C-n>', ':bn<CR>', { noremap = true })
vim.keymap.set('n', '<leader>ww', ':e ~/vimwiki/index.md<CR>', { noremap = true})
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { noremap = true })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { noremap = true })

--so I need to perfect this and remove it. At the moment the loop seems to only
--print out the last entry in the buffer list.
--vim.keymap.set('n', '<leader>ww', function()
    --    vim.g.vimwiki_index_open = not vim.g.vimwiki_index_open
    --this is meant to toggle the index buffer quickly, a map above already works
    --    if(vim.g.vimwiki_index_open) then
    --        print('will close')
    --        for i, b in ipairs(vim.api.nvim_list_bufs()) do
    --            print(i, b)
    --        end
    --    else
    --        print('will open')
    --    end
    --    --vim.keymap.set('n', '<leader>ww', ':vsp ~/vimwiki/index.md<CR>', { noremap = true})
    --end)

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

vim.keymap.set('n', '<leader>st', function()
    local fzf_lua = require('fzf-lua')
    fzf_lua.buffers()
end, { noremap = true})

vim.keymap.set('n', '<leader>w', function()
    local fzf_lua = require('fzf-lua')
    fzf_lua.files({cwd='~/vimwiki'})
end, { noremap = true})
