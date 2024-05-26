return {
  "echasnovski/mini.files",
  version = false,
  config = function()
    require("mini.files").setup({
      mappings = {
        close       = 'q',
        go_in       = 'i',
        go_in_plus  = 'I',
        go_out      = 'm',
        go_out_plus = 'M',
        reset       = '<BS>',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '=',
        trim_left   = '<',
        trim_right  = '>',
        lower      = 'n',
        higher      = 'e',
      },

      options = {
        permanent_delete = false,
        use_as_default_explorer = true,
      },

      --vim.keymap.set("n", "<C-/>", "<cmd>lua MiniFiles.open()<CR>"),
      vim.keymap.set("n", "<leader>/", "<cmd>lua MiniFiles.open()<CR>")
    })
  end
}
