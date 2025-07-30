local gray_color = "#86839f"

local theme = {
	normal = {
		a = { fg = gray_color, bg = "none" },
		b = { fg = gray_color, bg = "none" },
		c = { fg = gray_color, bg = "none" },
	},
	insert = {
		a = { fg = gray_color, bg = "none" },
		b = { fg = gray_color, bg = "none" },
		c = { fg = gray_color, bg = "none" },
	},
	visual = {
		a = { fg = gray_color, bg = "none" },
		b = { fg = gray_color, bg = "none" },
		c = { fg = gray_color, bg = "none" },
	},
	replace = {
		a = { fg = gray_color, bg = "none" },
		b = { fg = gray_color, bg = "none" },
		c = { fg = gray_color, bg = "none" },
	},
	command = {
		a = { fg = gray_color, bg = "none" },
		b = { fg = gray_color, bg = "none" },
		c = { fg = gray_color, bg = "none" },
	},
	inactive = {
		a = { fg = gray_color, bg = "none" },
		b = { fg = gray_color, bg = "none" },
		c = { fg = gray_color, bg = "none" },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = theme,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = { "no-neck-pain" },
				winbar = { "no-neck-pain" },
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
	config = function(_, opts)
		require("lualine").setup(opts)
		vim.cmd([[hi StatusLine guibg=NONE ]])
		vim.cmd([[hi StatusLineNC guibg=NONE ]])
	end,
}
