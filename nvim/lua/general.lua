local function nums()
    local current_state = vim.opt.number:get()
    vim.opt.number = not current_state
    vim.opt.relativenumber = not current_state
end
vim.api.nvim_create_user_command('Nums', nums, {})

local select_dir = function(opts, title, start_dir, find_command)
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"

    local list = vim.fn.systemlist(find_command)

    opts = opts or {}
    pickers.new(opts, {
        prompt_title = title,
        layout_strategy = 'vertical',
        finder = finders.new_table {
            results = list,
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.cmd("cd "..start_dir.."/"..selection[1])
            end)
            return true
        end,
    }):find()
end

local select_repo = function()
    local title = "Select Repository"
    local start_dir = "~/repos"
    local find_command = "find "..start_dir.." -maxdepth 1 -type d|awk 'BEGIN {FS=\"/\"} {if($NF != \".\" && $NF != \"repos\") print $NF}'"
    select_dir(require('telescope.themes').get_ivy{}, title, start_dir, find_command)
end
vim.keymap.set('n', '<leader>dd', function() select_repo() end, { noremap = true })

local select_local_dir = function()
    local title = "Select Directory"
    local start_dir = "."
    local find_command = "find "..start_dir.." -type d -not -path '*/.terragrunt-cache/*' -not -path '*/.git/*'"
    select_dir(require('telescope.themes').get_ivy{}, title, start_dir, find_command)
end
vim.keymap.set('n', '<leader>di', function() select_local_dir() end, { noremap = true })
--vim.api.nvim_create_user_command('Dir', select_local_dir, {})

local navigate_to_git_root = function()
    local path = vim.fn.system("git rev-parse --show-toplevel")
    vim.cmd("cd "..path)
end
vim.keymap.set('n', '<leader>td', function() navigate_to_git_root() end, { noremap = true })
