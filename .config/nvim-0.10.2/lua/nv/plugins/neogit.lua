return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		"nvim-telescope/telescope.nvim", -- optional
	},
	keys = {
		{ "<leader>gs", "<cmd>Neogit kind=vsplit<CR>" },
		{ "<leader>gc", "<cmd>Neogit commit<CR>" },
	},
	config = true,
}
