return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1003,

		config = function()
			require("catppuccin").setup({
				-- NOTE: latte flavour is all white
				flavour = "mocha", -- latte, frappe, macchiato, mocha
			})

			vim.cmd([[colorscheme catppuccin]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = false,
		priority = 1002,
		opts = {},

		config = function()
			require("tokyonight").setup({
				style = "night", -- Use the night style
				styles = {
					functions = {}, -- Disable italic for functions
					comments = { italic = true }, -- Italicize comments
					keywords = { bold = true }, -- Bold keywords
					variables = {}, -- Default style for variables
					strings = { italic = false }, -- Disable italic for strings
					types = { bold = true }, -- Bold types
				},
				on_colors = function(colors)
					colors.hint = colors.orange -- Change the "hint" color to the "orange" color
					colors.error = "#ff0000" -- Make the "error" color bright red
					colors.bg = "#1a1b26" -- Custom background color
					colors.fg = "#c0caf5" -- Custom foreground color
					colors.selection = "#33467C" -- Custom selection color
					colors.line_number = "#3b4261" -- Custom line number color
				end,
				on_highlights = function(hl, c)
					hl.Normal = { bg = c.bg, fg = c.fg } -- Customize Normal highlight group
					hl.Comment = { fg = c.comment, italic = true } -- Customize Comment highlight group
					hl.Function = { fg = c.blue, bold = true } -- Customize Function highlight group
					hl.Keyword = { fg = c.purple, bold = true } -- Customize Keyword highlight group
					hl.Variable = { fg = c.cyan } -- Customize Variable highlight group
					hl.String = { fg = c.green, italic = false } -- Customize String highlight group
					hl.Type = { fg = c.yellow, bold = true } -- Customize Type highlight group
					hl.LineNr = { fg = c.line_number } -- Customize line numbers
					-- hl.CursorLine = { bg = c.bg_dark }                       -- Customize cursor line background
					hl.CursorLineNr = { fg = c.orange, bold = true } -- Customize cursor line number
					hl.Visual = { bg = c.selection } -- Customize visual mode background
					hl.StatusLine = { fg = c.fg, bg = c.bg_highlight } -- Customize status line
					hl.StatusLineNC = { fg = c.fg_dark, bg = c.bg_highlight } -- Customize inactive status line
					hl.Pmenu = { bg = c.bg_popup, fg = c.fg } -- Customize popup menu
					hl.PmenuSel = { bg = c.bg_highlight, fg = c.fg_bright } -- Customize selected item in popup menu
					hl.TabLine = { bg = c.bg, fg = c.fg_dark } -- Customize tab line
					hl.TabLineSel = { bg = c.bg_highlight, fg = c.fg } -- Customize selected tab
					hl.TabLineFill = { bg = c.bg } -- Customize tab line fill
					hl.DiagnosticError = { fg = c.error } -- Customize diagnostic errors
					hl.DiagnosticWarn = { fg = c.warning } -- Customize diagnostic warnings
					hl.DiagnosticInfo = { fg = c.info } -- Customize diagnostic info
					hl.DiagnosticHint = { fg = c.hint } -- Customize diagnostic hints
				end,
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1004,

		config = function()
			require("gruvbox").setup({
				terminal_colors = true, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})

			vim.o.background = "dark" -- or "light" for light mode
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
}
