return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	lazy = vim.fn.argc(-1) == 0,
	-- build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	opts = {
		highlight = {
			enable = true,
			disable = { "latex" },
		},
		additional_vim_regex_highlighting = { "org" },
		-- enable indentation
		indent = { enable = true },
		-- ensure these language parsers are installed
		ensure_installed = {
			"json",
			"javascript",
			"java",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"prisma",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"nix",
			"org",
			"latex",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				-- init_selection = "<C-space>",
				-- node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
		require("treesitter-context").setup({
			max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 1, -- Maximum number of lines to show for a single context
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			z_index = 40,

			vim.cmd([[
        augroup TreesitterContextHighlight
            autocmd!
            autocmd WinEnter,BufEnter * hi! link TreesitterContext CursorColumn
        augroup END
    ]]),
		})
	end,
}
