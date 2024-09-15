return {
	{
		"lambdalisue/vim-suda",
	},
	{
		"Pocco81/true-zen.nvim",
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

	-- TODO: Redo the keymaps and put it in the keymaps file

	-- local opts = { noremap = true, silent = true }
	--
	-- -- Move to previous/next
	-- map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
	-- map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
	-- -- Re-order to previous/next
	-- map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
	-- map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
	-- -- Goto buffer in position...
	-- map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
	-- map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
	-- map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
	-- map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
	-- map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
	-- map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
	-- map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
	-- map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
	-- map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
	-- map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
	-- -- Pin/unpin buffer
	-- map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
	-- -- Close buffer
	-- map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
	-- -- Wipeout buffer
	-- --                 :BufferWipeout
	-- -- Close commands
	-- --                 :BufferCloseAllButCurrent
	-- --                 :BufferCloseAllButPinned
	-- --                 :BufferCloseAllButCurrentOrPinned
	-- --                 :BufferCloseBuffersLeft
	-- --                 :BufferCloseBuffersRight
	-- -- Magic buffer-picking mode
	-- map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
	-- -- Sort automatically by...
	-- map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
	-- map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
	-- map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
	-- map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
	-- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
	--
	-- -- Other:
	-- -- :BarbarEnable - enables barbar (enabled by default)
	-- -- :BarbarDisable - very bad command, should never be used
}
