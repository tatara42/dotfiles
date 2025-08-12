return {
	-- https://github .com/numToStr/Comment.nvim
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>/",
				---Block-comment toggle keymap
				block = "gbc",
			},
			-- -LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment keymap
				line = "<leader>/",
				---Block-comment keymap
				block = "gbc",
			},
			---LHS of extra mappings
			extra = {
				---Add comment on the line above
				above = "gcO",
				---Add comment on the line below
				below = "gco",
				---Add comment at the end of line
				eol = "gcA",
			},
		})
	end,
}
