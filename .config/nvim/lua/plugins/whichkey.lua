return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		triggers = {
			{ "<leader>o", mode = { "n", "x" } },
			{ "<leader>n", mode = { "n", "x" } },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
