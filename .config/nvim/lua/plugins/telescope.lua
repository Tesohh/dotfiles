return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		dependencies = { "nvim-lua/plenary.nvim", "echasnovski/mini.icons" },
		opts = {},
		cmd = "Telescope",
		keys = {
			{
				"<leader>f",
				function()
					require("telescope.builtin").find_files({
						hidden = true,
						file_ignore_patterns = {
							"target/",
							"node_modules/",
							".git/",
							"*.png",
							"*.wav",
							"*.mp3",
							"*.o",
							"*.ttf",
							"*.class",
						},
					})
				end,
				desc = "search code files (exclude media, object files)",
				mode = { "n", "x" },
			},
			{
				"<leader>sf",
				"<cmd>Telescope git_files theme=dropdown<cr>",
				desc = "search only git files",
				mode = { "n", "x" },
			},
			{
				"<leader>sw",
				"<cmd>Telescope live_grep<cr>",
				desc = "search words (live grep)",
				mode = { "n", "x" },
			},
			{
				"<leader>ss",
				"<cmd>Telescope lsp_document_symbols theme=ivy<cr>",
				desc = "search lsp symbols",
				mode = { "n", "x" },
			},
			{
				"<leader>S",
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				desc = "search lsp symbols in workspace",
				mode = { "n", "x" },
			},
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "git commits", mode = { "n", "x" } },
		},
	},
}
