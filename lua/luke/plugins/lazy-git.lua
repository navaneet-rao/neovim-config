return {
	{
		"kdheepak/lazygit.nvim",
		name = "lazygit",
		cmd = "LazyGit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")

			vim.g.lazygit_floating_window_winblend = 0
			vim.g.lazygit_floating_window_scaling_factor = 0.9
			vim.g.lazygit_floating_window_border_chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
			vim.g.lazygit_floating_window_use_plenary = 0
			vim.g.lazygit_use_neovim_remote = 1

			vim.g.lazygit_use_custom_config_file_path = 0
			vim.g.lazygit_config_file_path = {}
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		name = "gitsigns.nvim",
		-- event = "BufReadPost",
		require("gitsigns").setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			-- Optional: Customize other settings as needed
			sign_priority = 6,
			update_debounce = 100,
			word_diff = false,
			current_line_blame = false,
			current_line_blame_opts = { virt_text = true, virt_text_pos = "eol" },
			diff_opts = { internal = true },
		}),
	},
}
