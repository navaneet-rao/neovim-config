return {
	{
		"mbbill/undotree",
		config = function()
			-- Set up key mappings
			vim.api.nvim_set_keymap("n", "<leader><F5>", ":UndotreeToggle<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreePersistUndo<CR>", { noremap = true, silent = true })

			-- Configure undotree options
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_SplitWidth = 35
			vim.g.undotree_WindowLayout = 2
			vim.g.undotree_HelpLine = 0
		end,
	},
}
