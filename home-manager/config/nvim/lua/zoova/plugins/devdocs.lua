return {
	"luckasRanarison/nvim-devdocs",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"ellisonleao/glow.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		format = "markdown",
		filetypes = {
			javascript = { "javascript", "react" },
			typescript = { "javascript", "typescript", "react" },
		},
		float_win = { -- passed to nvim_open_win(), see :h api-floatwin
			relative = "editor",
			height = 45,
			width = 150,
		},
		cmd_ignore = {},
		picker_cmd = true,
		picker_cmd_args = { "-s", "dark", "-w", "110" },
		mappings = {
			open_in_browser = "<leader>ob",
			toggle_rendering = "<leader>or",
		},
		warp = true,
		previewer_cmd = "glow",
		cmd_args = { "-s", "auto", "-w", "120" },
		ensure_installed = {
			"html",
			"css",
			"javascript",
			"typescript",
			"lua-5.4",
			"nix",
			"node",
			"vite",
			"sass",
			"tailwindcss",
			"yarn-berry",
			"web_extensions",
			"webpack-5",
			"react",
		},
	},

	config = function(_, opts)
		require("nvim-devdocs").setup(opts)

		-- vim.keymap.set("n", "<leader>di", function()
		-- 	vim.cmd("DevdocsOpenFloat")
		-- end, {})

		vim.keymap.set("n", "<leader>di", function()
			vim.fn.feedkeys(":DevdocsOpenFloat ", "n")
		end, {})

		vim.keymap.set("n", "<leader>do", function()
			vim.cmd("DevdocsToggle")
		end, {})

		vim.keymap.set("n", "<leader>doc", function()
			vim.cmd("DevdocsOpenCurrent")
		end, {})

		vim.keymap.set("n", "<leader>df", function()
			vim.cmd("DevdocsOpenCurrentFloat")
		end, {})
	end,
}
