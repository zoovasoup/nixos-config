-- FoldText = function()
-- 	local foldStartLine = table.concat(vim.fn.getbufline(vim.api.nvim_get_current_buf(), vim.v.foldstart))
-- 	local filler = "·"
-- 	local indent = foldStartLine:match("^%s*"):len()
-- 	-- local indent = foldStartLine:match("^%s*"):len() * vim.opt.tabstop:get() - 1 or 2
--
-- 	local title = " " .. foldStartLine:gsub("^%s*", "") or "fold" .. " "
-- 	local number = " [" .. tostring((vim.v.foldend - vim.v.foldstart) + 1) .. " Lines" .. "] "
--
-- 	local totalVirtualColumns = vim.api.nvim_win_get_width(0) - vim.fn.getwininfo(vim.fn.win_getid())[1].textoff
-- 	local fillCharLen = totalVirtualColumns
-- 		- vim.fn.strchars(string.rep(filler, 3) .. string.rep(filler, indent) .. title .. number .. filler)
--
-- 	local _out = string.rep(filler, indent) .. title .. string.rep(filler, fillCharLen) .. number
--
-- 	return _out
-- end
--
-- vim.o.foldtext = "v:lua.FoldText()"

-- use this later ========
FoldText = function()
	local foldStartLine = table.concat(vim.fn.getbufline(vim.api.nvim_get_current_buf(), vim.v.foldstart))
	local filler = "·"

	-- Calculate the leading indentation
	local indent = foldStartLine:match("^%s*"):len()

	-- NOTE: in lua, the indentation seems like it count the 'tab' instead of the 'tabstop'
	-- i also has the `expandtab = true`
	-- so i just multiply the value by 2
	-- the '-1' is for the whitespace before the title
	if vim.bo.filetype == "lua" then
		indent = indent * 2 - 1
	else
		indent = indent - 1
	end

	-- Remove leading whitespace for the title and preserve it
	local title = " " .. foldStartLine:match("^%s*(.*)") .. " "
	local number = " [" .. tostring((vim.v.foldend - vim.v.foldstart) + 1) .. " Lines" .. "] "

	-- Calculate the total number of virtual columns available for the window
	local totalVirtualColumns = vim.api.nvim_win_get_width(0) - vim.fn.getwininfo(vim.fn.win_getid())[1].textoff

	-- Calculate the length of the fill characters
	local fillCharLen = totalVirtualColumns - vim.fn.strwidth(string.rep(filler, indent) .. title .. number .. filler)

	-- Ensure fillCharLen is non-negative
	fillCharLen = math.max(fillCharLen, 0)

	-- Construct the output with consistent indentation
	local _out = string.rep(filler, indent) .. title .. string.rep(filler, fillCharLen) .. number

	return _out
end

-- Set the custom fold text function
vim.o.foldtext = "v:lua.FoldText()"
