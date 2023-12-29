local function dir()
    local fzf_lua = require('fzf-lua')
    local opts = {}
    opts.actions = {
        ['default'] = function(selected)
            vim.cmd('cd '..selected[1])
        end
    }
    fzf_lua.fzf_exec('git ls-files | xargs -n 1 -d "\n" dirname | sort | uniq', opts)
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

local function nums()
    local current_state = vim.opt.number:get()
    vim.opt.number = not current_state
    vim.opt.relativenumber = not current_state
end
vim.api.nvim_create_user_command('Nums', nums, {})

local function tf_state()
    --check if we are in a dir that has terragrunt.hcl
    --fail if not and let user know why
    --may consider a tfv type function to get to dir fast
    local fzf_lua = require('fzf-lua')
    local opts = {}
    opts.actions = {
        ['default'] = function(selected)
            --vim.cmd('echo '..selected[1])
            vim.cmd('echo here')
        end
    }
    fzf_lua.fzf_exec('terragrunt state list', opts)
end
vim.api.nvim_create_user_command('TFState', tf_state, {})
