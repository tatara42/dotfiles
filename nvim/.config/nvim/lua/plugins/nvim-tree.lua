return {
	-- https://github.com/nvim-tree/nvim-tree.lua
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})
		vim.keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <cr>", {})
	end,
}