vim.keymap.set("n", "fo", require("ufo").openAllFolds)
vim.keymap.set("n", "fO", require("ufo").closeAllFolds)
vim.keymap.set("n", "fu", function()
	local windid = require("ufo").peekFoldedLinesUnderCursor()
	if not windid then
		vim.lsp.buf.hover()
	end
end)

require("ufo").setup({
	provider_selector = function(bufnr, filetype, buftype)
		-- return { "lsp", "indent" }
		return { "treesitter", "indent" }
	end,
})
