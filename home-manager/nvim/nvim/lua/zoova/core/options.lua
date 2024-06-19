local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = true -- disable line wrapping
opt.linebreak = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.signcolumn = "yes"

vim.cmd.autocmd("VimResized * :wincmd =")

opt.incsearch = true
opt.scrolloff = 7

vim.g.terminal_typer = "foot"

vim.cmd([[
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=200}
]])

vim.cmd('let $TZ = "Asia/Bangkok"')

vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

-- vim.o.foldlevel = 4
-- vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- Create an autocommand group
vim.api.nvim_create_augroup("CustomFoldLevel", { clear = true })

-- Set foldlevel to 1 for .org files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "org",
	callback = function()
		vim.opt_local.foldlevel = 3
		vim.opt_local.foldmethod = "expr"
		vim.o.foldexpr = "v:lua.require('orgmode.org.fold').foldexpr()"
	end,
	group = "CustomFoldLevel",
})
