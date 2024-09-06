return {
	{
		"windwp/nvim-autopairs",
		event = "insertenter",
		config = function()
			-- if you want insert `(` after select function or method item
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			require("nvim-autopairs").setup({
				disable_filetype = { "telescopeprompt", "vim" },
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "bufReadPost",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPost",
		opts = {},
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		event = "bufReadPost",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
		config = function()
			require("tailwind-tools").setup({})
		end,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		event = "InsertEnter", -- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({})
		end,
	},
}
