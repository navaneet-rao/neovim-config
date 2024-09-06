return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		config = function()
			require("trouble").setup({})
			-- require("telescope").load_extension("ui-select")
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				FIX = {
					icon = "",
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "ERROR" },
				},
				TODO = { icon = "󰙎", color = "info" },
				HACK = { icon = "󰈸", color = "#FFA500" },
				WARN = { icon = "󱈸", color = "#FFF000", alt = { "WARNING", "XXX" } },
				PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = "󰎇", color = "hint", alt = { "INFO" } },
				TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		},
	},
}
