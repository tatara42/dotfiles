return {
	{ -- This plugin
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
		opts = {},
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
	    opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},

			vim.keymap.set("n", "<leader>ro", "<cmd>CompilerOpen<CR>"),
			vim.keymap.set("n", "<leader>rr", "<cmd>CompilerRedo<CR>"),
			vim.keymap.set("n", "<leader>rt", "<cmd>CompilerToggleResults<CR>"),
			vim.keymap.set("n", "<leader>rs", "<cmd>CompilerStop<CR>"),
		},
	},
}
