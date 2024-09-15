return {
	{
		"nvim-telescope/telescope.nvim",
		event = "BufReadPost",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					prompt_prefix = "❯ ",
					layout_defaults = {
						horizontal = {
							width_padding = 0.1,
							height_padding = 0.1,
							preview_width = 0.6,
						},
						vertical = {
							width_padding = 0.05,
							height_padding = 1,
							preview_height = 0.5,
						},
					},
					bg = "none",
					layout_strategy = "flex",
					scroll_strategy = "cycle",
					selection_strategy = "reset",
					color_devicons = true,
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				},

				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		"mbbill/undotree",
		name = "undotree",
		cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus" },
		config = function()
			-- Set up key mappings
			-- TODO: move Keymaps to keymaps file
			vim.api.nvim_set_keymap("n", "<leader><F5>", ":UndotreeToggle<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreePersistUndo<CR>")

			-- Configure undotree options
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_SplitWidth = 35
			vim.g.undotree_WindowLayout = 2
			vim.g.undotree_HelpLine = 1
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

		config = function()
			require("telescope").setup({
				require("telescope").setup({
					extensions = {
						file_browser = {
							theme = "ivy",
							-- disables netrw and use telescope-file-browser in its place
							hijack_netrw = true,
						},
					},
				}),
			})
			require("telescope").load_extension("file_browser")
		end,
	},
}
