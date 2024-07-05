return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"tsserver",
					"clangd",
					"html",
					"dockerls",
					"jsonls",
					"pyright",
					-- "jedi_language_server",
					"sqlls",
					"intelephense",
					"cssls",
					"golangci_lint_ls",
					"gopls",
					"arduino_language_server",
					"asm_lsp",
					-- "tailwindcss",
					"neocmake",
					"cmake",
					"ast_grep",
					"harper_ls",
					"jdtls",
					"lemminx",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.tsserver.setup({ capabilities = capabilities })

			-- to generate the compile_commands.json to as below
			-- use the below commonf if ur using cmake eith ur c/c++ projects
			-- -- cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
			-- -- make
			--
			--  and for projects with only make use
			--  -- bear -- make all

			lspconfig.clangd.setup({ capabilities = capabilities })

			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.dockerls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			-- lspconfig.jedi_language_server.setup({ capabilities = capabilities })
			lspconfig.sqlls.setup({ capabilities = capabilities })
			lspconfig.intelephense.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.golangci_lint_ls.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.arduino_language_server.setup({ capabilities = capabilities })
			lspconfig.asm_lsp.setup({ capabilities = capabilities })
			-- lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.neocmake.setup({ capabilities = capabilities })
			lspconfig.cmake.setup({ capabilities = capabilities })
			lspconfig.ast_grep.setup({ capabilities = capabilities })
			lspconfig.lemminx.setup({ capabilities = capabilities })

			-- lspconfig.harper_ls.setup({ capabilities = capabilities })

			lspconfig.jdtls.setup({
				-- jdtls requires min java vesion 0f 17
				capabilities = capabilities,
				settings = {
					java = {
						configuration = {
							runtimes = {
								{
									name = "JavaSE-17",
									path = "/usr/lib/jvm/java-17-openjdk-amd64",
									default = false,
								},
								{
									name = "JavaSE-11",
									path = "/usr/lib/jvm/java-11-openjdk-amd64",
									default = false,
								},
								{
									name = "JavaSE-19",
									path = "/usr/lib/jvm/java-19-openjdk-amd64",
									default = true,
								},
							},
						},
					},
				},
			})
		end,
	},
}
