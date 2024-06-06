return {
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		dependencies = {
			"dhruvasagar/vim-table-mode",
		},
		ft = { "org" },
		config = function()
			require("orgmode").setup({
				org_agenda_files = "~/Documents/orgmode/*",
				org_default_notes_file = "~/Documents/orgmode/refile.org",
				org_startup_folded = "inherit",
				win_split_mode = { "float", 0.8 },
				org_tags_column = 0,
				org_todo_keywords = { "TODO", "ASSIGNMEN", "PENDING", "|", "DONE" },
				org_capture_templates = {
					r = {
						description = "Repo",
						template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
						target = "~/Documents/orgmode/repos.org",
					},
				},
				-- win_border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
				win_border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				mappings = {
					capture = {
						org_capture_finalize = "<C-c>",
					},
				},
			})
		end,
	},
	{
		"chipsenkbeil/org-roam.nvim",
		tag = "0.1.0",
		dependencies = {
			{
				"nvim-orgmode/orgmode",
				tag = "0.3.4",
			},
		},
		config = function()
			require("org-roam").setup({
				directory = "~/Documents/orgmode",
			})
		end,
	},
}
