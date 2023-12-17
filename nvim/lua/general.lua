function dir()
    local fzf_lua = require'fzf-lua'
    opts = {}
    opts.actions = {
        ['default'] = function(selected)
            vim.cmd('cd '..selected[1])
        end
    }
    fzf_lua.fzf_exec('git ls-files | xargs -n 1 dirname | sort | uniq', opts)
end
vim.api.nvim_create_user_command('Dir', dir, {})

vim.keymap.set('n', '<leader>d', function() 
    local fzf_lua = require('fzf-lua')
    opts = {}
    opts.actions = {
        ['default'] = function(selected)
            vim.cmd('cd '..vim.g.repos_dir..'/'..selected[1])
        end
    }
    fzf_lua.fzf_exec('ls '..vim.g.repos_dir, opts)
end)

vim.keymap.set('n', '<leader>gg', function()
    fzf_lua = require('fzf-lua')
    fzf_lua.live_grep()
end)

function nums()
    local state = vim.opt.number:get()
    vim.opt.number = not state
    vim.opt.relativenumber = not state
end
vim.api.nvim_create_user_command('Nums', nums, {})

local terminal_group = vim.api.nvim_create_augroup('terminal', { clear = true })
vim.api.nvim_create_autocmd({'TermOpen'}, {
    pattern = '*',
    callback = function(event)
        nums()
        vim.cmd ':normal a'
        vim.api.nvim_buf_set_keymap(0, 't', '<C-w>', '<C-\\><C-N><C-w>', { noremap = true })
    end
})
