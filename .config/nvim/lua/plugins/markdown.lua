return {
	{ "bullets-vim/bullets.vim" },
	{
		"antonk52/markdowny.nvim",
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use standalone mini plugins
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			heading = {
				width = "block",
			},
			-- indent = {
			-- 	enabled = true,
			-- 	render_modes = { "i", "o" },
			-- },
		},
	},
}
