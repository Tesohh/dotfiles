return {
	"rose-pine/neovim",
	name = "rose-pine",
	opts = {
		disable_italics = true,
		highlight_groups = {
			Comment = { italic = true },
			Folded = { fg = "muted" },
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd([[color rose-pine]])
	end,
}
