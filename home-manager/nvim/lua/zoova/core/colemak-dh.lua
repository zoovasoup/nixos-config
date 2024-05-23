local function set_mapping(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- vim.keymap.del("o", "i", {})

set_mapping("", "m", "h", {})
-- set_mapping("", "n", "jzzzv", {})
-- set_mapping("", "e", "kzzzv", {})
set_mapping("", "n", "jzz", {})
set_mapping("", "e", "kzz", {})
set_mapping({ "n", "v" }, "i", "l", {})

set_mapping("", "M", "H", {})
set_mapping("", "N", "J", {})
set_mapping("", "E", "K", {})
set_mapping({ "n", "v" }, "I", "L", {})

set_mapping("", "h", "m", {})
-- set_mapping("", "k", "n", {})
set_mapping("", "k", "nzzzv", {})
set_mapping("", "j", "e", {})
set_mapping({ "n", "v" }, "l", "i", {})

set_mapping("", "H", "M", {})
-- set_mapping("", "K", "N", {})
set_mapping("", "K", "Nzzzv", {})
set_mapping("", "J", "E", {})
set_mapping({ "n", "v" }, "L", "I", {})
