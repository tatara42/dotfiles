-- =============================================================================
-- General Keymappings
-- =============================================================================

-- Clear search highlight
vim.keymap.set("n", "<leader>h", ":nohls<CR>", { desc = "Clear search highlights" })

-- -----------------------------------------------------------------------------
-- Moving Text & Lines
-- -----------------------------------------------------------------------------
-- Move visual selection up/down while maintaining indent and selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Join lines below without moving cursor position
vim.keymap.set("n", "J", "mzJ'z", { desc = "Join line below (keep cursor in place)" })

-- -----------------------------------------------------------------------------
-- Centered Navigation & Scrolling
-- -----------------------------------------------------------------------------
-- Half-page scroll keeping cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- Keep search results centered and folds open when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search match (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search match (centered)" })

-- -----------------------------------------------------------------------------
-- Clipboard & Register Management
-- -----------------------------------------------------------------------------
-- Paste over visual selection without losing register contents (void register)
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over selection without overwriting register" })

-- Copy to system clipboard (+ register)
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- Paste from system clipboard (+ register)
vim.keymap.set("n", "<leader>v", '"+p', { desc = "Paste from system clipboard" })

-- Delete to void register (do not pollute yank history)
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking (to void register)" })

-- -----------------------------------------------------------------------------
-- Quick Utilities & Refactoring
-- -----------------------------------------------------------------------------
-- Disable Ex mode (prevent accidental Q press)
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Search and replace word currently under cursor across entire buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
	desc = "Search and replace word under cursor",
})

-- Make current file executable (chmod +x)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
	silent = true,
	desc = "Make current file executable (chmod +x)",
})
