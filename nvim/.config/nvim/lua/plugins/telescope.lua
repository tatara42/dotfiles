return {
	-- https://github.com/nvim-telescope/telescope.nvim
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		cmd = "Telescope",
		event = "VeryLazy",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },

			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
			{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Show Diagnostics" },
			{ "grr", "<cmd>Telescope lsp_references<cr>", desc = "LSP References" },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
