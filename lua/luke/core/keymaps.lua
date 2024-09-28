-----------------
-- My Key Maps --
-----------------

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

local builtin = require("telescope.builtin")

local harpoon = require("harpoon")

local keymaps = {
	{
		mode = "n",
		key = "<leader>ter",
		action = function()
			vim.cmd.split()
			vim.cmd.term()
		end,
		desc = "Open Termeinal",
	},

	-- Window Navigation
	{ mode = "n", key = "<C-h>", action = "<C-w><C-h>", desc = "Move to left window" },
	{ mode = "n", key = "<C-j>", action = "<C-w><C-j>", desc = "Move to bottom window" },
	{ mode = "n", key = "<C-k>", action = "<C-w><C-k>", desc = "Move to top window" },
	{ mode = "n", key = "<C-l>", action = "<C-w><C-l>", desc = "Move to right window" },
	-- General

	{
		mode = "i",
		key = "<leader>jj",
		action = "<esc>",
		desc = "Escape insert mode",
	},
	{
		mode = "n",
		key = "<C-b>",
		action = "<Cmd>Neotree reveal current<CR>",
		desc = "Toggle Neo Tree",
	},
	{
		mode = "n",
		key = "<leader>gg",
		action = "<Cmd>LazyGit<CR>",
		desc = "Open LazyGit",
	},

	-- LSP Config
	{
		mode = "n",
		key = "gD",
		action = vim.lsp.buf.declaration,
		opts = {},
		desc = "Go to declaration",
	},
	{
		mode = "n",
		key = "gd",
		action = vim.lsp.buf.definition,
		opts = {},
		desc = "Go to definition",
	},
	{
		mode = "n",
		key = "K",
		action = vim.lsp.buf.hover,
		opts = {},
		desc = "Hover",
	},
	{
		mode = "n",
		key = "gi",
		action = vim.lsp.buf.implementation,
		opts = {},
		desc = "Go to implementation",
	},
	{
		mode = "n",
		key = "nil", --TODO: remap
		action = vim.lsp.buf.signature_help,
		opts = {},
		desc = "Signature help",
	},
	{
		mode = "n",
		key = "<space>wa",
		action = vim.lsp.buf.add_workspace_folder,
		opts = {},
		desc = "Add workspace folder",
	},
	{
		mode = "n",
		key = "<space>wr",
		action = vim.lsp.buf.remove_workspace_folder,
		opts = {},
		desc = "Remove workspace folder",
	},
	{
		mode = "n",
		key = "<space>D",
		action = vim.lsp.buf.type_definition,
		opts = {},
		desc = "Go to type definition",
	},
	{
		mode = "n",
		key = "<space>rn",
		action = vim.lsp.buf.rename,
		opts = {},
		desc = "Rename",
	},
	{
		mode = { "n", "v" },
		key = "<space>ca",
		action = vim.lsp.buf.code_action, -- TODO: maybe use LSPsage code action
		opts = {},
		desc = "Code action",
	},
	{
		mode = "n",
		key = "gr",
		action = vim.lsp.buf.references,
		opts = {},
		desc = "References",
	},
	{
		mode = "n",
		key = "<space>wl",
		action = function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end,
		opts = {},
		desc = "List workspace folders",
	},
	{
		mode = "n",
		key = "<space>f",
		action = function()
			vim.lsp.buf.format({ async = true })
		end,
		opts = {},
		desc = "Format code",
	},

	-- Undo Tree
	{
		mode = "n",
		key = "<leader><F5>",
		action = vim.cmd.UndotreeToggle,
		desc = "Toggle Undo Tree",
	},

	-- Trouble
	{
		mode = "n",
		key = "<leader>tt",
		action = "<cmd>Trouble<cr>",
		desc = "[t]oggle",
	},
	{

		mode = "n",
		key = "<leader>tl",
		action = "<cmd>Trouble lsp toggle focus=true<cr>",
		desc = "[t]oggle [l]sp",
	},
	{
		mode = "n",
		key = "<leader>td",
		action = "<cmd>:Trouble diagnostics toggle focus=true<cr>",
		desc = "[t]oggle [d]sp",
	},
	{
		mode = "n",
		key = "<leader>tn", --TODO: add previous too
		action = function()
			require("trouble").next({ skip_groups = true, jump = true })
		end,
		desc = "[t]rouble [n]ext item",
	},
	{
		mode = "n",
		key = "<leader><F6>",
		action = function()
			require("trouble").toggle("workspace_diagnostics")
		end,
		desc = "[ ][F6] toggle trouble workspace diagnostics",
	},
	{
		mode = "n",
		key = "<leader>xd",
		action = function()
			require("trouble").toggle("document_diagnostics")
		end,
		desc = "[ ][x] Toggle Trouble [d]ocument diagnostics",
	},
	{
		mode = "n",
		key = "<leader>xq",
		action = function()
			require("trouble").toggle("quickfix")
		end,
		desc = "[ ][x] Toggle Trouble [q]uickfix",
	},
	{
		mode = "n",
		key = "<leader>xl",
		action = function()
			require("trouble").toggle("loclist")
		end,
		desc = "[ ][x] Toggle Trouble [l]oclist",
	},
	{
		mode = "n",
		key = "gR", --TODO: remap this
		action = function()
			require("trouble").toggle("lsp_references")
		end,
		desc = "Toggle Trouble LSP references",
	},

	-- Harpoon
	{
		mode = "n",
		key = "<leader>a",
		action = function()
			harpoon:list():add()
		end,
		desc = "Add file to Harpoon",
	},
	{
		mode = "n",
		key = "<C-e>",
		action = function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		desc = "Toggle Harpoon quick menu",
	},
	{
		mode = "n",
		key = "nil", --TODO: remap
		action = function()
			harpoon:list():select(1)
		end,
		desc = "Navigate to Harpoon file 1",
	},
	{
		mode = "n",
		key = "<C-t>",
		action = function()
			harpoon:list():select(2)
		end,
		desc = "Navigate to Harpoon file 2",
	},
	{
		mode = "n",
		key = "<C-n>",
		action = function()
			harpoon:list():select(3)
		end,
		desc = "Navigate to Harpoon file 3",
	},
	{
		mode = "n",
		key = "<C-s>",
		action = function()
			harpoon:list():select(4)
		end,
		desc = "Navigate to Harpoon file 4",
	},
	{ -- TODO: remap keys
		mode = "n",
		key = "nil",
		action = function()
			harpoon:list():prev()
		end,
		desc = "Navigate to previous Harpoon file",
	},
	{
		mode = "n",
		key = "nil",
		action = function()
			harpoon:list():next()
		end,
		desc = "Navigate to next Harpoon file",
	},

	-- Telescope
	{
		mode = "n",
		key = "<leader>ff",
		action = builtin.find_files,
		desc = "[f]ind [f]iles",
	},
	{
		mode = "n",
		key = "<leader>//",
		action = "<CR>:Telescope keymaps<CR>",
		desc = "Open Telescope keymaps",
	},
	{
		mode = "n",
		key = "<leader>fg",
		action = builtin.live_grep,
		desc = "[f]ind Live [g]rep",
	},
	{
		mode = "n",
		key = "<leader>fb",
		action = builtin.buffers,
		desc = "[f]ind [b]uffers",
	},
	{
		mode = "n",
		key = "<leader>fh",
		action = builtin.help_tags,
		desc = "[f]ind [h]elp tags",
	},
	{
		mode = "n",
		key = "<leader>fm",
		action = builtin.man_pages,
		desc = "[f]ind [m]an pages",
	},
	{
		mode = "n",
		key = "<leader>fc",
		action = builtin.commands,
		desc = "[f]ind [c]ommands",
	},
	-- {
	-- 	mode = "n",
	-- 	key = "<leader>fr",
	-- 	action = builtin.reloader,
	-- 	desc = "[f]ind [r]eload modules",
	-- },
	-- {
	-- 	mode = "n",
	-- 	key = "<leader>fo",
	-- 	action = builtin.oldfiles,
	-- 	desc = "[f]ind [o]ld files",
	-- },
	{
		mode = "n",
		key = "<leader>fws",
		action = function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end,
		desc = "Grep string under cursor (word)",
	},
	{
		mode = "n",
		key = "<leader>fWs",
		action = function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end,
		desc = "Grep string under cursor (WORD)",
	},

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
	--
}

-- Apply the keymaps
for _, map in ipairs(keymaps) do
	keymap(map.mode, map.key, map.action, opts or {})
end
