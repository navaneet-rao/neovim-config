return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
			disable_netrw = true,
			hijack_netrw = true,
			open_on_setup = true,
			auto_close = true,
			update_to_buf_dir = {
				enable = true,
				auto_open = true,
			},
			hijack_cursor = true,
			update_cwd = true,
			lsp_diagnostics = true,
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			system_open = {
				cmd = nil,
				args = {},
			},
			filters = {
				dotfiles = true,
				custom = {},
			},
			view = {
				width = 30,
				side = "left",
				auto_resize = false,
				mappings = {
					custom_only = false,
					list = {},
				},
			},
		})
	end,
}
