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
			["@markup.strong"] = { fg = "love", bold = true },
			["@markup.italic"] = { fg = "iris", italic = true },
			["@markup.raw.markdown_inline"] = { bg = "overlay", fg = "gold" },
			["@markup.heading.1"] = { fg = "rose", bold = true },
			["@markup.heading.2"] = { fg = "iris", bold = true },
			["@markup.heading.3"] = { fg = "foam", bold = true },
			["@markup.heading.4"] = { fg = "pine", bold = true },
			["@markup.heading.5"] = { fg = "gold", bold = true },
			-- ["@markup.raw.typst"] = { bg = "overlay", fg = "gold" },
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd([[color rose-pine]])
	end,
}
