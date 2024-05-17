vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zK", function()
	local windid = require("ufo").peekFoldedLinesUnderCursor()
	if not windid then
		vim.lsp.buf.hover()
	end
end)

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { "lsp", "indent" }
	end,
})
