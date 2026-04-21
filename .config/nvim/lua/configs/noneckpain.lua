require("no-neck-pain").setup({
	width = 150,
	autocmds = {
		enableOnVimEnter = true,
		skipEnteringNoNeckPainBuffer = true,
	},
	buffers = {
		wo = {
			-- fillchars = "eob: ,vert: ",
		},
		-- b = {
		-- 	ministatusline_disable = true,
		-- },
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = "no-neck-pain",
	callback = function()
		vim.b.ministatusline_disable = true
	end,
})
