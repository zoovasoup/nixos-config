require("oil").setup()
vim.keymap.set("n", "<C-/>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

require("Comment").setup()

require("gitsigns").setup()
