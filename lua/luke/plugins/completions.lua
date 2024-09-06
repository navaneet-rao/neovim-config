return {
	{
		"j-hui/fidget.nvim",
		event = "LspAttach", -- Load when an LSP attaches to a buffer
		lazy = true,
		config = function()
			-- Your fidget.nvim configuration here
			require("fidget").setup({
				-- Options related to LSP progress subsystem
				progress = {
					poll_rate = 0, -- How and when to poll for progress messages
					suppress_on_insert = false, -- Suppress new messages while in insert mode
					ignore_done_already = false, -- Ignore new tasks that are already complete
					ignore_empty_message = false, -- Ignore new tasks that don't contain a message
					-- Clear notification group when LSP server detaches
					clear_on_detach = function(client_id)
						local client = vim.lsp.get_client_by_id(client_id)
						return client and client.name or nil
					end,
					-- How to get a progress message's notification group key
					notification_group = function(msg)
						return msg.lsp_client.name
					end,
					ignore = {}, -- List of LSP servers to ignore

					-- Options related to how LSP progress messages are displayed as notifications
					display = {
						render_limit = 16, -- How many LSP messages to show at once
						done_ttl = 3, -- How long a message should persist after completion
						done_icon = "✔", -- Icon shown when all LSP progress tasks are complete
						done_style = "Constant", -- Highlight group for completed LSP tasks
						progress_ttl = math.huge, -- How long a message should persist when in progress
						-- Icon shown when LSP progress tasks are in progress
						progress_icon = { pattern = "dots", period = 1 },
						-- Highlight group for in-progress LSP tasks
						progress_style = "WarningMsg",
						group_style = "Title", -- Highlight group for group name (LSP server name)
						icon_style = "Question", -- Highlight group for group icons
						priority = 30, -- Ordering priority for LSP notification group
						skip_history = true, -- Whether progress notifications should be omitted from history
						-- How to format a progress message
						format_message = require("fidget.progress.display").default_format_message,
						-- How to format a progress annotation
						format_annote = function(msg)
							return msg.title
						end,
						-- How to format a progress notification group's name
						format_group_name = function(group)
							return tostring(group)
						end,
						overrides = { -- Override options from the default notification config
							rust_analyzer = { name = "rust-analyzer" },
						},
					},

					-- Options related to Neovim's built-in LSP client
					lsp = {
						progress_ringbuf_size = 0, -- Configure the nvim's LSP progress ring buffer size
						log_handler = false, -- Log `$/progress` handler invocations (for debugging)
					},
				},

				-- Options related to notification subsystem
				notification = {
					poll_rate = 10, -- How frequently to update and render notifications
					filter = vim.log.levels.INFO, -- Minimum notifications level
					history_size = 128, -- Number of removed messages to retain in history
					override_vim_notify = false, -- Automatically override vim.notify() with Fidget
					-- How to configure notification groups when instantiated
					configs = { default = require("fidget.notification").default_config },
					-- Conditionally redirect notifications to another backend
					redirect = function(msg, level, opts)
						if opts and opts.on_open then
							return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
						end
					end,

					-- Options related to how notifications are rendered as text
					view = {
						stack_upwards = true, -- Display notification items from bottom to top
						icon_separator = " ", -- Separator between group name and icon
						group_separator = "---", -- Separator between notification groups
						-- Highlight group used for group separator
						group_separator_hl = "Comment",
						-- How to render notification messages
						render_message = function(msg, cnt)
							return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
						end,
					},

					-- Options related to the notification window and buffer
					window = {
						normal_hl = "Comment", -- Base highlight group in the notification window
						winblend = 100, -- Background color opacity in the notification window
						border = "none", -- Border around the notification window
						zindex = 45, -- Stacking priority of the notification window
						max_width = 0, -- Maximum width of the notification window
						max_height = 0, -- Maximum height of the notification window
						x_padding = 1, -- Padding from right edge of window boundary
						y_padding = 0, -- Padding from bottom edge of window boundary
						align = "bottom", -- How to align the notification window
						relative = "editor", -- What the notification window position is relative to
					},
				},

				-- Options related to integrating with other plugins
				integration = {
					["nvim-tree"] = {
						enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
					},
					["xcodebuild-nvim"] = {
						enable = true, -- Integrate with wojciech-kulik/xcodebuild.nvim (if installed)
					},
				},

				-- Options related to logging
				logger = {
					level = vim.log.levels.WARN, -- Minimum logging level
					max_size = 10000, -- Maximum log file size, in KB
					float_precision = 0.01, -- Limit the number of decimals displayed for floats
					-- Where Fidget writes its logs to
					path = string.format("%s/fidget.nvim.log", vim.fn.stdpath("cache")),
				},
			})
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup({
				-- TODO: mention this keymaps in the keymaps page
				toggler = { -- in Normal mode
					line = "gcc", -- Line-comment toggle keymap
					block = "gbc", -- Block-comment toggle keymap
				},
				opleader = { -- in visual mode
					line = "gc", -- Line-comment keymap
					block = "gb", -- Block-comment keymap
				},
				mappings = {
					basic = true, -- Operator-pending mapping; `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
					extra = true, -- Extra mapping; `gco`, `gcO`, `gcA`
				},
			})
		end,
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
				experimental = {
					ghost_text = false,
				},
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.recently_used,
						require("clangd_extensions.cmp_scores"),
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})
		end,
	},
}
