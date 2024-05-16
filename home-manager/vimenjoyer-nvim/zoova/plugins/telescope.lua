local actions = require("telescope.actions")
require('telescope').setup({
  defaults = {
    path_display = { "truncate " },
    mappings = {
      i = {
        ["<C-e>"] = actions.move_selection_previous, -- move to prev result
        ["<C-n>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["e"] = actions.move_selection_previous, -- move to prev result
        -- ["n"] = actions.move_selection_next, -- move to next result
        -- ["q"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
})

require('telescope').load_extension('fzf')

