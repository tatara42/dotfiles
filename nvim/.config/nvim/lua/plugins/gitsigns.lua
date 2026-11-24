return {
  "lewis6991/gitsigns.nvim",
  enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation between diff hunks
      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Git: Next Hunk" })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, { expr = true, desc = "Git: Previous Hunk" })

      -- Actions
      map("n", "<leader>hs", gs.stage_hunk, { desc = "Git: Stage Hunk" })
      map("n", "<leader>hr", gs.reset_hunk, { desc = "Git: Reset Hunk" })
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Git: Stage Selected Range" })
      map("v", "<leader>hr", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Git: Reset Selected Range" })
      map("n", "<leader>hS", gs.stage_buffer, { desc = "Git: Stage Entire Buffer" })
      map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git: Undo Stage Hunk" })
      map("n", "<leader>hp", gs.preview_hunk, { desc = "Git: Preview Hunk" })
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, { desc = "Git: Blame Line" })
      map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Git: Toggle Current Line Blame" })
      map("n", "<leader>hd", gs.diffthis, { desc = "Git: Diff Against Index" })
    end,
  },
}
