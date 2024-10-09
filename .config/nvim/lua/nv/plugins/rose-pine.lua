return {
	"rose-pine/neovim",
	name = "rose-pine",
	opts = {
		disable_italics = true,
		highlight_groups = {
			Comment = { italic = true },
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd([[color rose-pine]])
	end,
}
