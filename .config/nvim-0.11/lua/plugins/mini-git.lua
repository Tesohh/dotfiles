return {
	{ "echasnovski/mini.diff", opts = true, event = "BufRead" },
	{
		"nvim-mini/mini-git",
		version = "*",
		opts = {},
		config = function(_, opts)
			require("mini.git").setup()
		end,
	},
	-- { "echasnovski/mini-git", opts = true, version = "*", event = "VeryLazy" },
}
