return {
	"nvim-lualine/lualine.nvim",
	event = "BufReadPost",
	dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				-- theme = "nightfly",
				-- theme = 'gruvbox-material',
				-- component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				component_separators = { left = " ▍", right = " ▍" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				-- lualine_a = { hello },
				-- lualine_a = { "FugitiveHead" },
				-- lualine_a = { "g:coc_status", "bo:filetype" },
				lualine_b = { "branch", "tag", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				-- lualine_c = { "%=", "%t%m" },
				-- lualine_c = { "os.date('%a')", "data" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = {
					"progress",
					"filesize",
					{
						function()
							return vim.fn.line("$")
						end,
						icon = "",
					},
				},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "fugitive", "nvim-tree", "quickfix" },
		})
	end,
}
