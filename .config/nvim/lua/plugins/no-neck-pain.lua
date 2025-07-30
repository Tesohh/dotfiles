return {
	"shortcuts/no-neck-pain.nvim",
	opts = {
		width = 120,
		autocmds = {
			enableOnVimEnter = true,
			skipEnteringNoNeckPainBuffer = true,
		},
		buffers = {
			wo = {
				fillchars = "eob: ,vert: ",
			},
			right = {
				scratchPad = {
					enabled = false,
				},
			},
			left = {
				scratchPad = {
					enabled = false,
				},
			},
		},
	},
}
