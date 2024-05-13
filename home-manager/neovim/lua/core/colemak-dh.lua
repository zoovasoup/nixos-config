local function set_mapping(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- vim.keymap.del("o", "i", {})

set_mapping("", "m", "h", {})
set_mapping("", "n", "j", {})
set_mapping("", "e", "k", {})
set_mapping({ "n", "v" }, "i", "l", {})

set_mapping("", "M", "H", {})
set_mapping("", "N", "J", {})
set_mapping("", "E", "K", {})
set_mapping({ "n", "v" }, "I", "L", {})

set_mapping("", "h", "m", {})
set_mapping("", "k", "n", {})
set_mapping("", "j", "e", {})
set_mapping({ "n", "v" }, "l", "i", {})

set_mapping("", "H", "M", {})
set_mapping("", "K", "N", {})
set_mapping("", "J", "E", {})
set_mapping({ "n", "v" }, "L", "I", {})

-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"gc"**
-- - rhs: `<Plug>(comment_toggle_linewise)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"gr"**
-- - rhs: `<Plug>ReplaceWithRegisterOperator`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"gb"**
-- - rhs: `<Plug>(comment_toggle_blockwise)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"yS"**
-- - rhs: `<Plug>(nvim-surround-normal-line)`
-- - WARNING conflicting keymap exists for mode **"n"**, lhs: **"ys"**
-- - rhs: `<Plug>(nvim-surround-normal)`
-- - WARNING conflicting keymap exists for mode **"o"**, lhs: **"i"**
-- - rhs: `l`
