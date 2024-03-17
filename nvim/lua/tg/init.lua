local plan = function()
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"

    local list = vim.fn.systemlist("find . -name terragrunt.hcl -type f -not -path '*/.terragrunt-cache/*'")

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
                local bufnr = vim.api.nvim_create_buf(true, true)
                local p = string.match(selection[1], "(.*/)")
                local path = vim.fn.getcwd() .. string.sub(p, 2, #p)

                vim.cmd("sb" .. bufnr)
                vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, {"running plan on " .. path .. "..."})
                vim.fn.jobstart({"terragrunt", "plan", "-no-color"}, {
                    cwd = path,
                    stdout_buffered = true,
                    on_stdout = function(_, data)
                        if data then
                            vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
                        end
                    end,
                    on_stderr = function(_, data)
                        if data then
                            vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
                        end
                    end
                })
            end)
            return true
        end,
    }):find()
end
vim.api.nvim_create_user_command("TGP", plan, {})

return {
    plan = plan,
}
