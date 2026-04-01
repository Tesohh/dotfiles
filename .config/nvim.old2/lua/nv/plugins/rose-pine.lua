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
		require(".config.nvim.lua.configs.rose-pine").setup(opts)
		vim.cmd([[color rose-pine]])
	end,
}
