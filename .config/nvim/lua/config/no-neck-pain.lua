require("no-neck-pain").setup({
	width = 120,
	autocmds = {
		enableOnVimEnter = true,
		skipEnteringNoNeckPainBuffer = true,
	},
	buffers = {
		wo = {
			fillchars = "eob: ,vert: ", -- TEMP: vert
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
})
