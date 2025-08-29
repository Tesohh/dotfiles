return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "VeryLazy",
	enabled = false,
	opts = {
		provider_selector = function(bufnr, filetype, buftype)
			return { "treesitter", "indent" }
		end,
	},
	keys = {
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
		},
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
		},
	},
}
