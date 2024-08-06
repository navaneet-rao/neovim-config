return {
	"ThePrimeagen/harpoon",
	name = "harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon").setup({})
		require("telescope").load_extension("harpoon")
	end,
}
