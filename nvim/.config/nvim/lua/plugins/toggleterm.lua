return {
	-- amongst your other plugins
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			-- Example settings
			size = 20, -- Terminal size, adjust to your preference
			direction = "float", -- Floating terminal
		},
		config = function()
			-- Setup the toggleterm plugin
			require("toggleterm").setup({})

			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<M-i>", [[<C-u><C-d>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
		vim.api.nvim_set_keymap(
			"n",
			"<M-i>",
			":ToggleTerm direction=float dir=%:p:h<CR>",
			{ noremap = true, silent = false }
		),
	},
}
