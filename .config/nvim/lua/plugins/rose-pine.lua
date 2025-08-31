return {
	"rose-pine/neovim",
	name = "rose-pine",
	opts = {
		disable_italics = true,
		highlight_groups = {
			Comment = { italic = true },
			Folded = { fg = "muted" },
			["@org.keyword.todo"] = { fg = "love" },
			["@org.keyword.done"] = { fg = "muted" },
			["@org.bold"] = { fg = "love" },
			["@org.bold.delimiter"] = { fg = "love" },
			["@org.italic"] = { fg = "iris", italic = true },
			["@org.italic.delimiter"] = { fg = "iris", italic = true },
			["@org.headline.level3"] = { fg = "rose" },
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd([[color rose-pine]])
	end,
}
