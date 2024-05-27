return{
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      vim.keymap.set("n", "<C-/>", "<CMD>Oil<CR>")
    })
  end
}
