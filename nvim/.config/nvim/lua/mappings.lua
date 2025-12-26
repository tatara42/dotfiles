local map = vim.keymap.set

-- map("n", ";", ":", {})
map("i", "jk", "<ESC>", {})

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
-- vim.keymap.set("n", "<c-k>", "<cmd>wincmd k<CR>")
-- vim.keymap.set("n", "<c-j>", "<cmd>wincmd j<CR>")
-- vim.keymap.set("n", "<c-h>", "<cmd>wincmd h<CR>")
-- vim.keymap.set("n", "<c-l>", "<cmd>wincmd l<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ'z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>v", '"+p')

vim.keymap.set("v", "<leader>d", '"_d')
vim.keymap.set("n", "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<Tab>", "<cmd>tabnext<CR>", {desc = "Tab Next"})
-- vim.keymap.set("n", "<S-Tab>", "<cmd>tabprevious<CR>", {desc = "Tab Previous"})
