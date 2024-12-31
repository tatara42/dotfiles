return {
	-- https://github.com/williamboman/mason.nvim
	--  https://github.com/williamboman/mason-lspconfig.nvim
	--  https://github.com/neovim/nvim-lspconfig
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			local lsp_server = {
				"tailwindcss",
				"tsserver",
				"clangd",
				"pylsp",
				"lua_ls",
				"html",
				"cssls",
				"intelephense",
				"csharp_ls",
			}

			for _, lsp in ipairs(lsp_server) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
