return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
 		'nvim-telescope/telescope.nvim',
		'nvim-telescope/telescope-file-browser.nvim',
		'nvim-telescope/telescope-fzf-native.nvim',
	},
	config = function()
        require('telescope').setup({
            defaults = {
                layout_strategy = 'vertical',
                layout_config = { width = 0.8 },
            },
            extensions = {
				file_browser = {
					theme = 'ivy',
					hijack_netrw = true,
				},
				fzf = {
					fuzzy = true,
				},
			},
		})

		require('telescope').load_extension('file_browser')
		require('telescope').load_extension('fzf')
	end,
}
