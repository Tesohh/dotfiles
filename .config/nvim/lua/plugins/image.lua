return {
	{
		"3rd/image.nvim",
		ft = { "markdown", "org", "norg" },
		enabled = false,
		opts = {
			processor = "magick_rock",
			integrations = {
				org = {
					enabled = true,
				},
			},
		},
	},
}
