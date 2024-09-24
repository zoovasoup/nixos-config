return {
	-- {"lifepillar/vim-gruvbox8",branch = "neovim" },
	--
	-- "bluz71/vim-moonfly-colors",
	-- name = "moonfly",
	-- lazy = false,
	-- priority = 1000,
	--
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,

	-- "olivercederborg/poimandres.nvim",
	config = function()
		vim.cmd.colorscheme("moonfly")
	end,

	-- "aktersnurra/no-clown-fiesta.nvim",
	--
	-- config = function()
	-- 	vim.cmd.colorscheme("no-clown-fiesta")
	--
	-- 	vim.cmd.hi("SignColumn guibg=NONE")
	-- 	-- vim.cmd.hi("CursorLineSign guibg=#3c3836")
	-- 	vim.cmd.hi("CursorLineSign guibg=NONE")
	-- 	vim.cmd.hi("FoldColumn guibg=NONE")
	-- 	-- vim.cmd.hi("CursorLineFold guibg=#3c3836")
	-- 	vim.cmd.hi("CursorLineFold guibg=NONE")
	-- 	vim.cmd.hi("LineNr guibg=NONE")
	-- 	vim.cmd.hi("CursorLineNr guibg=NONE")
	-- 	vim.cmd.hi("NormalFloat guibg=NONE")
	-- end,
}
