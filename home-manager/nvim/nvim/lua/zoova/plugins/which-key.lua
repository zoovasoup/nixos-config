return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	enabled = false,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		show_help = true, -- show a help message in the command line for using WhichKey
		show_keys = true, -- show the currently pressed key and its label as a message in the command line
		triggers = "", -- automatically setup triggers
	},
}
