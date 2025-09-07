return {
	"stevearc/oil.nvim",
	enabled = true,
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{ "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } },
	},
	lazy = false,
}
