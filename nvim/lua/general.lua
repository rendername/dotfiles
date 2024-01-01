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

local goto_repo = function(opts)
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"

    local repos_dir = "~/repos"
    local list = vim.fn.systemlist("ls "..repos_dir)

    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "colors",
        finder = finders.new_table {
            results = list
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd("cd "..repos_dir.."/"..selection[1])
            end)
            return true
        end,
    }):find()
end
vim.keymap.set('n', '<leader>d', function()
    goto_repo()
end, { noremap = true })
