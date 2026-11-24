return {
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme gruvbox")
      vim.o.background = "dark"
    end,
  },
  {
  	"ramojus/mellifluous.nvim",
    enabled = true,
  	config = function()
  		require("mellifluous").setup({}) -- optional, see configuration section.
  		vim.cmd("colorscheme mellifluous")
  	end,
  },
}
