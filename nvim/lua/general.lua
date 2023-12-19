local function dir()
    local fzf_lua = require('fzf-lua')
    local opts = {}
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
    local opts = {}
    opts.actions = {
        ['default'] = function(selected)
            vim.cmd('cd '..vim.g.repos_dir..'/'..selected[1])
        end
    }
    fzf_lua.fzf_exec('ls '..vim.g.repos_dir, opts)
end)

local function nums(desired_state)
    --trying to pass in on or off explicitly OR just flip the current state
    --this is failing so far. Need explicit "off" for when we create a terminal
    --because multi-terminal causes nums to be on terminal OR when I turn off
    --nums for a buffer and spawn a terminal because it was always flipping the state
    --0 = off, 1 = on
    --local current_state = vim.opt.number:get()
    --local new_state = desired_state[1] or not current_state
    --
    --vim.opt.number = new_state
    --vim.opt.relativenumber = new_state
end
vim.api.nvim_create_user_command('Nums', nums, {})

vim.api.nvim_create_augroup('terminal', { clear = true })
vim.api.nvim_create_autocmd({'TermOpen'}, {
    group = 'terminal',
    pattern = '*',
    callback = function()
        nums(0)
        vim.cmd ':normal a'
        vim.api.nvim_buf_set_keymap(0, 't', '<C-w>', '<C-\\><C-N>', { noremap = true })
        --since pasting is difficult think about adding another keymap that makes it easier
        --may even be able to restore this to only hit <C-w> once for switching like it was
    end
})

local function tf_state()
    --check if we are in a dir that has terragrunt.hcl
    --fail if not and let user know why
    --may consider a tfv type function to get to dir fast
    local fzf_lua = require('fzf-lua')
    local opts = {}
    opts.actions = {
        ['default'] = function(selected)
            vim.cmd('echo '..selected[1])
        end
    }
    fzf_lua.fzf_exec('terragrunt state list', opts)
end
vim.api.nvim_create_user_command('TFState', tf_state, {})
