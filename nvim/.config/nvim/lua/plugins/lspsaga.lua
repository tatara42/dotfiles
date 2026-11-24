return {
  "nvimdev/lspsaga.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
        devicon = true,
      },
      hover = {
        max_width = 0.8,
        max_height = 0.8,
        open_link = "gx",
      },
      diagnostic = {
        show_code_action = true,
        border_follow = true,
      },
      lightbulb = {
        enable = false,
      },
      symbol_in_winbar = {
        enable = false,
      },
    })

    -- Ensure border highlight groups are visible
    vim.api.nvim_set_hl(0, "SagaBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "HoverBorder", { link = "FloatBorder" })
  end,
}
