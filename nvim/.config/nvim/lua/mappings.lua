local map = vim.keymap.set

-- map("n", ";", ":", {})
map("i", "jk", "<ESC>", {})
map("i", "<C-h>", "<Left>", {})
map("i", "<C-j>", "<Down>", {})
map("i", "<C-k>", "<Up>", {})
map("i", "<C-l>", "<Right>", {})

vim.keymap.set("n", "<leader>h", ":nohls<CR>")

map("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "Go To Definition" })
map("n", "grr", "<cmd>Telescope lsp_references<CR>", {})
map("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "LSP Code Action" })
map("n", "grd", function()
	vim.diagnostic.open_float()
end, {
	desc = "Show Diagnostic under cursor",
})

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")
vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")

vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")

-- code runner
-- vim.api.nvim_set_keymap("n", "<Leader>r", "<cmd>:!echo %<CR>", { noremap = true, silent = true })
