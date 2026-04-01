return {
	{
		"folke/lazydev.nvim",
		dependencies = {
			{ "DrKJeff16/wezterm-types", lazy = true },
		},
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				"lazy.nvim",
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "wezterm-types", mods = { "wezterm" } },
			},
		},
	},
}
