vim.keymap.set("n", "<leader>e", ":NERDTreeToggle<cr>")
vim.keymap.set("n", "<leader>n", function() require("telescope.builtin").find_files({cwd="~/vimwiki"}) end)
vim.keymap.set("n", "<leader>i", function() require("telescope.builtin").find_files({cwd="~/.config/nvim"}) end)
vim.keymap.set("n", "<leader>s", function() require("telescope.builtin").find_files({cwd="~/.config/scripts"}) end)

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<leader>tt", function() vim.cmd(":sp term://bash") end)
vim.keymap.set("n", "<leader>vt", function() vim.cmd(":vsp term://bash") end)
vim.keymap.set("t", "<C-w>", "<C-\\><C-n>")
