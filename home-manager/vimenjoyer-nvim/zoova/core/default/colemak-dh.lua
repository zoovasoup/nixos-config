-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local function set_mapping(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Up/down/left/right
set_mapping("", "m", "h", {})
set_mapping("", "n", "j", {})
set_mapping("", "e", "k", {})
set_mapping("", "i", "l", {})

-- Words forward/backward
set_mapping("", "z", "b", {})
set_mapping("", "Z", "B", {})
set_mapping("", "f", "e", {})
set_mapping("", "F", "E", {})
set_mapping("", "t", "f", {})
set_mapping("", "T", "F", {})
set_mapping("", "w", "w", {})
set_mapping("", "W", "W", {})
-- set_mapping({'c'}, '<C-Z>', '<C-Left>', {})
-- set_mapping({'c'}, '<C-W>', '<C-Right>', {})

-- inSert/Replace/append (T)
set_mapping("", "u", "i", {})
set_mapping("", "U", "I", {})
set_mapping("", "a", "a", {})
set_mapping("", "A", "A", {})
set_mapping("", "y", "o", {})
set_mapping("", "Y", "O", {})
set_mapping("", "r", "s", {})
set_mapping("", "R", "S", {})

-- Change
set_mapping("", "d", "c", {})
set_mapping("", "D", "C", {})
set_mapping("", "dd", "cc", {})

-- Cut/copy/paste
set_mapping("", "s", "d", {})
set_mapping("", "x", "x", {})
set_mapping("", "j", "y", {})
set_mapping("", ";", "p", {})
set_mapping("", "ss", "dd", {})
set_mapping("", "jj", "yy", {})
set_mapping("", ":", "P", {})
set_mapping("", "g;", "gp", {})
set_mapping("", "g:", "gP", {})

-- Undo/redo
set_mapping("", "l", "u", {})
set_mapping("", "L", "U", {})
set_mapping("", "<C-p>", "<C-r>", {})

-- Visual mode
set_mapping("", "v", "v", {})
set_mapping("", "V", "V", {})
set_mapping("", "gv", "gv", {})
set_mapping("v", "u", [[mode() =~# "[V]" ? "\<C-V>0o$I" : "I"]], {})
set_mapping("v", "U", [[mode() =~# "[V]" ? "\<C-V>0o$I" : "I"]], {})
set_mapping("v", "a", [[mode() =~# "[V]" ? "\<C-V>0o$A" : "A"]], {})
set_mapping("v", "A", [[mode() =~# "[V]" ? "\<C-V>0o$A" : "A"]], {})

-- Search
set_mapping("", "b", "t", {})
set_mapping("", "B", "T", {})
set_mapping("", "o", ";", {})
set_mapping("", ",", ",", {})
set_mapping("", "k", "n", {})
set_mapping("", "K", "N", {})

-- inneR text objects
set_mapping("", "u", "i", {})

-- Folds, etc.
set_mapping("", "x", "z", {})
set_mapping("", "xn", "zj", {})
set_mapping("", "xe", "zk", {})

-- Overridden keys with g prefix
set_mapping("", "C", "X", {})
set_mapping("", "E", "K", {})
set_mapping("", "I", "L", {})

-- Window handling
set_mapping("", "<C-W>m", "<C-W>h", {})
set_mapping("", "<C-W>n", "<C-W>j", {})
set_mapping("", "<C-W>e", "<C-W>k", {})
set_mapping("", "<C-W>i", "<C-W>l", {})

-- Command Mode
set_mapping("", "O", ":", {})
set_mapping("", "<C-o>", "<C-y>", {})
set_mapping("", "<C-i>", "<C-u>", {})
set_mapping("", "xx", "zz", {})
set_mapping("", "xb", "zt", {})
set_mapping("", "xz", "zb", {})

-- Normal Mode
set_mapping("n", "<C-k>", "<C-n>", {})
