vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>i", function() require("telescope.builtin").find_files({cwd="~/vimwiki"}) end)
vim.keymap.set("n", "<leader>c", function() require("telescope.builtin").find_files({cwd="~/.config/nvim"}) end)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
