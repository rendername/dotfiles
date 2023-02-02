vim.keymap.set("n", "<leader>a", require("harpoon.mark").toggle_file)
vim.keymap.set("n", "<leader>h", require("harpoon.ui").toggle_quick_menu)

vim.keymap.set("n", "<C-a>", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<C-o>", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<C-u>", function() require("harpoon.ui").nav_file(4) end)
