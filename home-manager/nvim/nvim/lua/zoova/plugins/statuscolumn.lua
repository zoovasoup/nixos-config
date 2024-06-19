return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			relculright = true,
			segments = {
				{
					text = { builtin.foldfunc },
					click = "v:lua.ScFa",
					auto = false,
				},
				{
					sign = {
						namespace = { "diagnostic" },
						maxwidth = 1,
						colwidth = 2,
						auto = false,
					},
					click = "v:lua.ScSa",
					hl = "guibg",
				},
				{
					text = { builtin.lnumfunc },
					click = "v:lua.ScLa",
					hl = "guibg",
				},
				{
					sign = {
						namespace = { "gitsigns" },
						name = { ".*" },
						maxwidth = 1,
						colwidth = 1,
						auto = false,
					},
					click = "v:lua.ScSa",
				},
			},
		})
	end,
}

-- this is color sample
--
--   gruvbox8
--   if has('nvim')
--     let g:terminal_color_0  = '#282828'
--     let g:terminal_color_1  = '#cc241d'
--     let g:terminal_color_2  = '#98971a'
--     let g:terminal_color_3  = '#d79921'
--     let g:terminal_color_4  = '#458588'
--     let g:terminal_color_5  = '#b16286'
--     let g:terminal_color_6  = '#689d6a'
--     let g:terminal_color_7  = '#a89984'
--     let g:terminal_color_8  = '#928374'
--     let g:terminal_color_9  = '#fb4934'
--     let g:terminal_color_10 = '#b8bb26'
--     let g:terminal_color_11 = '#fabd2f'
--     let g:terminal_color_12 = '#83a598'
--     let g:terminal_color_13 = '#d3869b'
--     let g:terminal_color_14 = '#8ec07c'
--     let g:terminal_color_15 = '#ebdbb2'
--   endif
--
--   gruvbox8_hard
--   if has('nvim')
--     let g:terminal_color_0  = '#1d2021'
--     let g:terminal_color_1  = '#cc241d'
--     let g:terminal_color_2  = '#98971a'
--     let g:terminal_color_3  = '#d79921'
--     let g:terminal_color_4  = '#458588'
--     let g:terminal_color_5  = '#b16286'
--     let g:terminal_color_6  = '#689d6a'
--     let g:terminal_color_7  = '#a89984'
--     let g:terminal_color_8  = '#928374'
--     let g:terminal_color_9  = '#fb4934'
--     let g:terminal_color_10 = '#b8bb26'
--     let g:terminal_color_11 = '#fabd2f'
--     let g:terminal_color_12 = '#83a598'
--     let g:terminal_color_13 = '#d3869b'
--     let g:terminal_color_14 = '#8ec07c'
--     let g:terminal_color_15 = '#ebdbb2'
--   endif
--
--   gruvbox8_soft
--   if has('nvim')
--     let g:terminal_color_0  = '#32302f'
--     let g:terminal_color_1  = '#cc241d'
--     let g:terminal_color_2  = '#98971a'
--     let g:terminal_color_3  = '#d79921'
--     let g:terminal_color_4  = '#458588'
--     let g:terminal_color_5  = '#b16286'
--     let g:terminal_color_6  = '#689d6a'
--     let g:terminal_color_7  = '#a89984'
--     let g:terminal_color_8  = '#928374'
--     let g:terminal_color_9  = '#fb4934'
--     let g:terminal_color_10 = '#b8bb26'
--     let g:terminal_color_11 = '#fabd2f'
--     let g:terminal_color_12 = '#83a598'
--     let g:terminal_color_13 = '#d3869b'
--     let g:terminal_color_14 = '#8ec07c'
--     let g:terminal_color_15 = '#ebdbb2'
--   endif
