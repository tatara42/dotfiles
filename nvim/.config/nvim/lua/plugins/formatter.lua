return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "golines" },
				php = { "pretty-php" },
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				yaml = { "yamlfmt" },
				cmake = { "cmakelang" },
                json = { "clang-format" },
                -- css = {"prettier" },
                -- html = { "prettier" },
                -- astro = { "prettier" },
			},
			format_on_save = false,

			-- format_after_save = {
			-- 	lsp_fallback = true,
			-- 	stop_after_first = true,
			-- },
			format_after_save = false,
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
