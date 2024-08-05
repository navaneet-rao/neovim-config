return {
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.golines,
					null_ls.builtins.formatting.gofmt,
				},
			})
		end,
	},
	{ -- Autoformat
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				python = { "isort", "black" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				javascript = { { "prettierd", "prettier" } },
				go = { { "gofmt", "gofumpts", "goimports", "golines" } },
			},
		},
		config = function(_, opts)
			local conform = require("conform")
			conform.setup(opts)

			-- Set up autocommand to format on save (Normal mode)
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*",
				callback = function()
					conform.format({ async = true })
				end,
			})
			-- Set up autocommand to format on leaving insert mode
			vim.api.nvim_create_autocmd("InsertLeave", {
				pattern = "*",
				callback = function()
					conform.format({ async = true })
				end,
			})
		end,
	},
}
