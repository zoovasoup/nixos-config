return {
	"lifepillar/vim-gruvbox8",
	branch = "neovim",
	config = function()
		vim.cmd.colorscheme("gruvbox8_soft")
		vim.cmd.hi("SignColumn guibg=NONE")
		-- vim.cmd.hi("CursorLineSign guibg=#3c3836")
		vim.cmd.hi("CursorLineSign guibg=NONE")
		vim.cmd.hi("FoldColumn guibg=NONE")
		-- vim.cmd.hi("CursorLineFold guibg=#3c3836")
		vim.cmd.hi("CursorLineFold guibg=NONE")
		vim.cmd.hi("LineNr guibg=NONE")
		vim.cmd.hi("CursorLineNr guibg=NONE")
	end,
}
