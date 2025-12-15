return {
	{ "bullets-vim/bullets.vim", enabled = false },
	{
		"antonk52/markdowny.nvim",
		enabled = false,
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			render_modes = { "n", "no", "v", "V", "Vs", "c", "cr", "!", "r", "x", "", "R", "i", "I", "" },
			completions = { lsp = { enabled = true } },
			heading = {
				width = "block",
				backgrounds = {},
			},
			indent = {
				enabled = true,
			},
		},
	},
}
