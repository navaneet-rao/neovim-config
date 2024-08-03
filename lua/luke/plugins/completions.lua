return {
	{
		"j-hui/fidget.nvim",
		config = function() end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local luasnip = require("luasnip")

			-- Load snippets from custom folder
			luasnip.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
			})

			for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("~/.config/nvim/lua/luke/snippets/*.lua", true)) do
				loadfile(ft_path)()
			end
			-- Key mappings for jumping within snippets
			-- vim.keymap.set({ "i", "s" }, "<C-k>", function()
			-- 	if luasnip.expand_or_jumpable() then
			-- 		luasnip.expand_or_jump()
			-- 	end
			-- end, { silent = true })
			--
			-- vim.keymap.set({ "i", "s" }, "<C-j>", function()
			-- 	if luasnip.jumpable(-1) then
			-- 		luasnip.jump(-1)
			-- 	end
			-- end, { silent = true })
			--
			-- vim.keymap.set({ "i", "s" }, "<C-l>", function()
			-- 	if luasnip.choice_active() then
			-- 		luasnip.change_choice(1)
			-- 	end
			-- end, { silent = true })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
			"luckasRanarison/tailwind-tools.nvim",
			"onsails/lspkind-nvim",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				formatting = {
					format = function(entry, vim_item)
						-- Setup lspkind
						vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol_text" })
						-- Add source name
						vim_item.menu = ({
							nvim_lsp = "[NLSP]",
							nvim_lua = "[NLua]",
							luasnip = "[LSnip]",
							buffer = "[Buffer]",
							path = "[Path]",
							vsnip = "[VSnip]",
							snippy = "[Snippy]",
							cmdline = "[Cmd]",
						})[entry.source.name]
						return vim_item
					end,
				},
				snippet = {
					expand = function(args)
						-- Setup for multiple snippet engines
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered({
						border = "double",
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "vsnip" },
					{ name = "snippy" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
					{ name = "cmdline" },
				}),
			})
		end,
	},
}
