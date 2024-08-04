-- Set tab-related options
vim.cmd("set expandtab") -- Use spaces instead of tabs
vim.cmd("set tabstop=4") -- Number of spaces that a <Tab> in the file counts for
vim.cmd("set softtabstop=4") -- Number of spaces that a <Tab> in the file counts for while editing
vim.cmd("set shiftwidth=4") -- Number of spaces to use for each step of (auto)indent
--vim.cmd("set autoindent") -- Copy indent from current line when starting a new line (typing <CR> in Insert mode)

-- Set line numbers to relative
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight column 80/120
vim.opt.colorcolumn = "120"

-- Set history size
vim.opt.history = 1000

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Set the leader key to space
vim.g.mapleader = " "

-- Enable nvim-tree devicons
vim.g.nvim_tree_devicons = { enable = true, default = true }
