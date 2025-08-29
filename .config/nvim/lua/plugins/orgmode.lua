return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-orgmode/telescope-orgmode.nvim",
		"nvim-orgmode/org-bullets.nvim",
		"Saghen/blink.cmp",
	},
	opts = {
		org_agenda_files = "~/Nextcloud/org/**/*",
		org_default_notes_file = "~/Nextcloud/org/refile.org",
		-- org_startup_folded = "inherit",
	},
	config = function(_, opts)
		require("orgmode").setup(opts)
		require("org-bullets").setup()
		require("blink.cmp").setup({
			sources = {
				per_filetype = {
					org = { "orgmode" },
				},
				providers = {
					orgmode = {
						name = "Orgmode",
						module = "orgmode.org.autocompletion.blink",
						fallbacks = { "buffer" },
					},
				},
			},
		})
		require("telescope").load_extension("orgmode")
		vim.keymap.set("n", "<leader>r", require("telescope").extensions.orgmode.refile_heading)
		vim.keymap.set("n", "<leader>sh", require("telescope").extensions.orgmode.search_headings)
		vim.keymap.set("n", "<leader>li", require("telescope").extensions.orgmode.insert_link)
	end,
}
