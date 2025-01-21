return {
	-- amongst your other plugins
	-- { "akinsho/toggleterm.nvim", version = "*", config = true },
	-- or
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = { --[[ things you want to change go here]]
		},
		config = function()
			require("toggleterm").setup({})
		end,
		vim.api.nvim_set_keymap("n", "<M-i>", ":ToggleTerm direction=float<CR>", { noremap = true, silent = false }),
	},
}
