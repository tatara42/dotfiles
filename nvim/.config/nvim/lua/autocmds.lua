local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- -----------------------------------------------------------------------------
-- Highlight on Yank (flashes copied region for visual confirmation)
-- -----------------------------------------------------------------------------
autocmd("TextYankPost", {
  group = augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- -----------------------------------------------------------------------------
-- Restore Last Cursor Position when opening a file
-- -----------------------------------------------------------------------------
autocmd("BufReadPost", {
  group = augroup("LastEditPos", { clear = true }),
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- -----------------------------------------------------------------------------
-- Auto-close certain temporary buffers with 'q'
-- -----------------------------------------------------------------------------
autocmd("FileType", {
  group = augroup("QuickClose", { clear = true }),
  pattern = { "help", "man", "qf", "checkhealth" },
  callback = function(args)
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = args.buf, silent = true })
  end,
})
