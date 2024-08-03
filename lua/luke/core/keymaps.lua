-----------------
-- My Key Maps --
-----------------

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

local keymaps = {
	-- General

	{
		mode = "n",
		key = "<leader>//",
		action = "<CR>:Telescope keymaps<CR>",
		desc = "Open Telescope keymaps",
	},
	{
		mode = "n",
		key = "<C-i>",
		action = "<Esc>o",
		opts = { noremap = true, silent = true },
		desc = "Insert new line below and enter insert mode",
	},
	{
		mode = "i",
		key = "<leader>jj",
		action = "<esc>",
		desc = "Escape insert mode",
	},
	{
		mode = "n",
		key = "<leader>E",
		action = ":E<CR>",
		desc = "Open Netrw Explorer",
	},
	{
		mode = "n",
		key = "<C-b>",
		action = "<Cmd>Neotree toggle<CR>",
		desc = "Toggle Neo Tree",
	},
	{
		mode = "n",
		key = "<leader>gg",
		action = "<Cmd>LazyGit<CR>",
		desc = "Open LazyGit",
	},

	-- Window Navigation
	{ mode = "n", key = "<C-h>", action = "<C-w>h", desc = "Move to left window" },
	{ mode = "n", key = "<C-j>", action = "<C-w>j", desc = "Move to bottom window" },
	{ mode = "n", key = "<C-k>", action = "<C-w>k", desc = "Move to top window" },
	{ mode = "n", key = "<C-l>", action = "<C-w>l", desc = "Move to right window" },

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
		key = "<C-k>",
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
		action = vim.lsp.buf.code_action,
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
		action = "<cmd>Trouble diagnostics toggle<cr>",
		desc = "Toggle Trouble diagnostics",
	},
	{
		mode = "n",
		key = "<leader>tn",
		action = function()
			require("trouble").next({ skip_groups = true, jump = true })
		end,
		desc = "Next Trouble item",
	},
	{
		mode = "n",
		key = "<leader><F6>",
		action = function()
			require("trouble").toggle("workspace_diagnostics")
		end,
		desc = "Toggle Trouble workspace diagnostics",
	},
	{
		mode = "n",
		key = "<leader>xd",
		action = function()
			require("trouble").toggle("document_diagnostics")
		end,
		desc = "Toggle Trouble document diagnostics",
	},
	{
		mode = "n",
		key = "<leader>xq",
		action = function()
			require("trouble").toggle("quickfix")
		end,
		desc = "Toggle Trouble quickfix",
	},
	{
		mode = "n",
		key = "<leader>xl",
		action = function()
			require("trouble").toggle("loclist")
		end,
		desc = "Toggle Trouble loclist",
	},
	{
		mode = "n",
		key = "gR",
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
			require("harpoon.mark").add_file()
		end,
		desc = "Add file to Harpoon",
	},
	{
		mode = "n",
		key = "<C-e>",
		action = function()
			require("harpoon.ui").toggle_quick_menu()
		end,
		desc = "Toggle Harpoon quick menu",
	},
	{
		mode = "n",
		key = "<C-h>",
		action = function()
			require("harpoon.ui").nav_file(1)
		end,
		desc = "Navigate to Harpoon file 1",
	},
	{
		mode = "n",
		key = "<C-t>",
		action = function()
			require("harpoon.ui").nav_file(2)
		end,
		desc = "Navigate to Harpoon file 2",
	},
	{
		mode = "n",
		key = "<C-n>",
		action = function()
			require("harpoon.ui").nav_file(3)
		end,
		desc = "Navigate to Harpoon file 3",
	},
	{
		mode = "n",
		key = "<C-s>",
		action = function()
			require("harpoon.ui").nav_file(4)
		end,
		desc = "Navigate to Harpoon file 4",
	},
	{
		mode = "n",
		key = "<C-S-P>",
		action = function()
			require("harpoon.ui").nav_prev()
		end,
		desc = "Navigate to previous Harpoon file",
	},
	{
		mode = "n",
		key = "<C-S-N>",
		action = function()
			require("harpoon.ui").nav_next()
		end,
		desc = "Navigate to next Harpoon file",
	},
}

-- Apply the keymaps
for _, map in ipairs(keymaps) do
	keymap(map.mode, map.key, map.action, opts or {})
end
