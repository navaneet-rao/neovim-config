vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Set line numbers
vim.cmd([[set number relativenumber]])

vim.cmd([[set colorcolumn=80]])
-- vim.cmd([[set nowrap]])
vim.cmd([[set history=1000]])

vim.cmd([[set clipboard=unnamedplus]])

vim.g.mapleader = " "
vim.g.nvim_tree_devicons = { enable = true, default = true }


