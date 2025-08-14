local map = vim.keymap.set

-- map("n", ";", ":", {})
map("i", "jk", "<ESC>", {})
map("i", "<C-h>", "<Left>", {})
map("i", "<C-j>", "<Down>", {})
map("i", "<C-k>", "<Up>", {})
map("i", "<C-l>", "<Right>", {})

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {})
map("n", "gr", "<cmd>Telescope lsp_references<CR>", {})
