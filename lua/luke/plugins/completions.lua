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
			local ls = require("luasnip")

			-- Load snippets from custom folder
			ls.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
			})

			-- vim.keymap.set({ "i" }, "<C-K>", function()
			-- 	ls.expand()
			-- end, { silent = true })
			--
			-- vim.keymap.set({ "i", "s" }, "<C-L>", function()
			-- 	ls.jump(1)
			-- end, { silent = true })
			--
			-- vim.keymap.set({ "i", "s" }, "<C-J>", function()
			-- 	ls.jump(-1)
			-- end, { silent = true })
			--
			-- vim.keymap.set({ "i", "s" }, "<C-E>", function()
			-- 	if ls.choice_active() then
			-- 		ls.change_choice(1)
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
			local luasnip = require("luasnip")
			local tailwind_formatter = require("tailwindcss-colorizer-cmp").formatter

			require("luasnip.loaders.from_vscode").lazy_load({ require("luke.snippets") })

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

						-- Apply tailwindcss-colorizer-cmp formatter for color
						vim_item = tailwind_formatter(entry, vim_item)

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
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
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
