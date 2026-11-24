return {
  "stevearc/oil.nvim",
  enabled = true,
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  keys = {
    { "<leader>o-", "<cmd>Oil<cr>", desc = "Open Oil file manager" },
  },
}
