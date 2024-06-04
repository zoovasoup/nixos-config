return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<C-m>", "<cmd>TmuxNavigateLeft<cr>" },
		{ "<C-n>", "<cmd>TmuxNavigateDown<cr>" },
		{ "<C-e>", "<cmd>TmuxNavigateUp<cr>" },
		{ "<C-i>", "<cmd>TmuxNavigateRight<cr>" },
		-- { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}
