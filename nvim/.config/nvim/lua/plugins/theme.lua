return {
	--[[ {
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function() end,
			vim.cmd("colorscheme gruvbox")
			vim.o.background = "dark"
	}, ]]
	{
		"ramojus/mellifluous.nvim",
		-- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
		config = function()
			require("mellifluous").setup({}) -- optional, see configuration section.
			vim.cmd("colorscheme mellifluous")
		end,
	},
}
