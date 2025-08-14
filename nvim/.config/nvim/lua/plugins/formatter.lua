return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				php = { "pretty-php" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				bash = { "shfmt" },
				sh = { "shfmt" },
			},
			format_on_save = false,

			format_after_save = {
				lsp_fallback = true,
				stop_after_first = true,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
