local treesitter = {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	requires = {
		"p00f/nvim-ts-rainbow", -- Rainbow parentheses
		"windwp/nvim-ts-autotag", -- Automatically close and rename HTML/XML tags
		"JoosepAlviste/nvim-ts-context-commentstring", -- Better commentstring support
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
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
			},
			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = true,
			},
			indent = {
				enable = true,
				disable = {},
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
}

return treesitter
