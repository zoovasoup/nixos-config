return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "add buffer to harpoon list" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "toggle harpoon list" })

		vim.keymap.set("n", "<C-1>", function()
			harpoon:list():select(1)
		end, { desc = "harpoon 1" })
		vim.keymap.set("n", "<C-2>", function()
			harpoon:list():select(2)
		end, { desc = "harpoon 2" })
		vim.keymap.set("n", "<C-3>", function()
			harpoon:list():select(3)
		end, { desc = "harpoon 3" })
		vim.keymap.set("n", "<C-4>", function()
			harpoon:list():select(4)
		end, { desc = "harpoon 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-k>", function()
			harpoon:list():prev()
		end, { desc = "harpoon prev" })
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end, { desc = "harpoon next" })

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<leader>po", function()
			toggle_telescope(harpoon:list())
		end, { desc = "harpoon telescope" })
	end,
}
