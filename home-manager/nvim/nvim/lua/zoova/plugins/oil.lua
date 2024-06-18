return{
  "stevearc/oil.nvim",
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      vim.keymap.set("n", "<leader>/", "<CMD>Oil<CR>")
    })
  end
}
