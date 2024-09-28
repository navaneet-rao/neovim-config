return {
	{
		"lambdalisue/vim-suda",
	},
	{
		"Pocco81/true-zen.nvim",
	},
	-- {
	-- 	"RRethy/vim-illuminate",
	-- },
	{
		"ekickx/clipboard-image.nvim",
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({})
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local alpha = require("alpha")
			local menu = require("alpha.themes.theta")

			menu.header.val = {
				[[                                                                       ]],
				[[                                                                     ]],
				[[       ████ ██████           █████      ██                     ]],
				[[      ███████████             █████                             ]],
				[[      █████████ ███████████████████ ███   ███████████   ]],
				[[     █████████  ███    █████████████ █████ ██████████████   ]],
				[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
				[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
				[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
				[[                                                                       ]],
			}

			alpha.setup(menu.config)
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		name = "nvim-web-devicons",
		event = "VimEnter",
		config = function()
			require("nvim-web-devicons").set_icon({})
		end,
	},
	{
		"pocco81/auto-save.nvim",
		enabled = false, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
		execution_message = {
			message = function() -- message to print on save
				return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
			end,
			events = { "InsertLeave", "TextChanged" },
			dim = 0.18, -- dim the color of `message`
			cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
		},
		trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
		-- function that determines whether to save the current buffer or not
		-- return true: if buffer is ok to be saved
		-- return false: if it's not ok to be saved
		condition = function(buf)
			local fn = vim.fn
			local utils = require("auto-save.utils.data")

			if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
				return true -- met condition(s), can save
			end
			return false -- can't save
		end,
		write_all_buffers = true, -- write all buffers when the current one meets `condition`
		debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
		callbacks = { -- functions to be executed at different intervals
			enabling = nil, -- ran when enabling auto-save
			disabling = nil, -- ran when disabling auto-save
			before_asserting_save = nil, -- ran before checking `condition`
			before_saving = nil, -- ran before doing the actual save
			after_saving = nil, -- ran after doing the actual save
		},
	},
	{
		"romgrk/barbar.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			animation = true,
			close_command = "bdelete!",
			mappings = true,
			insert_at_end = true,
			tabpages = true,
			theme = "bubblegum",
			tab_format = " #{n}: #{f} ",
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},

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
}
