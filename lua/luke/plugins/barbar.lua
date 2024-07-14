return {
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = true,
			close_command = "bdelete!",
			mappings = true,
			insert_at_end = true,
			tabpages = true,
			theme = "bubblegum",
			tab_format = " #{n}: #{f} ",
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
}
