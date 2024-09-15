local opt = vim.opt
local o = vim.o
local g = vim.g

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- Set line numbers to relative
opt.number = true
opt.relativenumber = true

opt.termguicolors = true
opt.cursorline = true

-- Highlight column 80/120
opt.colorcolumn = "120"

-- Set history size
opt.history = 10000

-- Use the system clipboard
opt.clipboard = "unnamedplus"

-- Set the leader key to space
g.mapleader = " "

-- Enable nvim-tree devicons
g.nvim_tree_devicons = { enable = true, default = true }

-- color Scheme
-- Ensure line number highlights are set last
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ff8800" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#00ff88", bold = true })
