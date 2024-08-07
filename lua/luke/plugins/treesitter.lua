local treesitter = {
	{
		"nvim-treesitter/nvim-treesitter",
		name = "nvim-treesitter",
		event = "BufReadPost",
		build = ":TSUpdate",
		requires = {
			"p00f/nvim-ts-rainbow", -- Rainbow parentheses
			"windwp/nvim-ts-autotag", -- Automatically close and rename HTML/XML tags
			"JoosepAlviste/nvim-ts-context-commentstring", -- Better commentstring support
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = true,
				auto_install = true,
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"html",
					"tsx",
					"json",
					"css",
				},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				rainbow = {
					enable = true,
					extended_mode = true,
				},
				autotag = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
				},
			})
		end,
	},
}

return treesitter
