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
				fillchars = "eob: ",
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
	config = function(_, opts)
		require("no-neck-pain").setup(opts)
		vim.keymap.set("n", "<leader>ns", "<cmd>NoNeckPainScratchPad<CR>")
		vim.keymap.set("n", "<leader>nn", "<cmd>NoNeckPain<CR>")
	end,
}
