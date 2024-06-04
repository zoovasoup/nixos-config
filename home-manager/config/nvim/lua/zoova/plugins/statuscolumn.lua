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
				},
				{
					text = { builtin.lnumfunc },
					click = "v:lua.ScLa",
				},
				{
					sign = {
						namespace = { "gitsigns" },
						name = { ".*" },
						maxwidth = 1,
						colwidth = 2,
						auto = false,
					},
					click = "v:lua.ScSa",
					hl = "LineNr",
				},
			},
		})
	end,
}
