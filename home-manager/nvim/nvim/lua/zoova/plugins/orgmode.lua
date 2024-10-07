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
				org_agenda_files = "~/Documents/orgmode/**/*",
				org_default_notes_file = "~/Documents/orgmode/inbox.org",
				org_startup_folded = "inherit",
				-- win_split_mode = { "float", 0.8 },
				org_tags_column = -10,
				org_highlight_latex_and_related = "native",
				org_todo_keywords = { "TODO", "ASSIGNMEN", "PENDING", "|", "DONE" },
				org_hide_leading_stars = false,
				org_startup_indented = false,
				org_adapt_indentation = false,
				org_custom_exports = {
					t = {
						label = "Export to PDF using pdftex",
						action = function(exporter)
							local current_file = vim.api.nvim_buf_get_name(0)
							local target = vim.fn.fnamemodify(current_file, ":p:r") .. ".pdf"
							local command = { "pdftex", "-interaction=batchmode", current_file }
							local on_success = function(output)
								print("Success!")
								vim.api.nvim_echo({ { table.concat(output, "\n") } }, true, {})
							end
							local on_error = function(err)
								print("Error!")
								vim.api.nvim_echo({ { table.concat(err, "\n"), "ErrorMsg" } }, true, {})
							end
							return exporter(command, target, on_success, on_error)
						end,
					},
				},
				notifications = {
					enabled = true,
					cron_enabled = true,
					repeater_reminder_time = false,
					deadline_warning_reminder_time = 2,
					reminder_time = 10,
					deadline_reminder = true,
					scheduled_reminder = true,
				},
				org_capture_templates = {
					l = {
						description = "link",
						template = "* [[%x][%?]] :link:",
						-- template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
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
				directory = "~/Documents/orgmode/roamfiles",
				extensions = {
					dailies = {
						directory = "journal",
						bindings = {
							capture_date = "<LocalLeader>ndD",
							capture_today = "<LocalLeader>ndN",
						},
						templates = {
							d = {
								description = "default",
								template = "%?",
								target = "%<%Y-%m-%d>.org",
							},
						},
					},
				},
				-- ui = {
				-- 	node_buffer = {
				-- 		show_keybindings = true,
				-- 	},
				ui = {
					node_buffer = {
						open = function()
							return vim.api.nvim_open_win(0, false, {
								relative = "editor",
								row = 10,
								col = 10,
								width = 50,
								height = 20,
							})
						end,
					},
				},
			})
		end,
	},
}
