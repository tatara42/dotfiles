return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "markdown" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
