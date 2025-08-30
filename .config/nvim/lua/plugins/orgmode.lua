return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	enabled = false,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-orgmode/telescope-orgmode.nvim",
		"nvim-orgmode/org-bullets.nvim",
		"danilshvalov/org-modern.nvim",
		"Saghen/blink.cmp",
	},
	opts = {
		org_agenda_files = "~/Nextcloud/org/**/*",
		org_default_notes_file = "~/Nextcloud/org/refile.org",
		org_startup_indented = true,
		ui = {
			input = {
				use_vim_ui = true,
			},
			menu = {
				handler = function(data)
					require("org-modern.menu")
						:new({
							window = {
								margin = { 1, 0, 1, 0 },
								padding = { 0, 1, 0, 1 },
								title_pos = "center",
								border = "single",
								zindex = 1000,
							},
							icons = {
								separator = "➜",
							},
						})
						:open(data)
				end,
			},
		},
	},
	config = function(_, opts)
		require("orgmode").setup(opts)
		require("org-bullets").setup()
		require("blink.cmp").setup()
		require("telescope").load_extension("orgmode")
		vim.keymap.set("n", "<leader>r", require("telescope").extensions.orgmode.refile_heading)
		vim.keymap.set("n", "<leader>sh", require("telescope").extensions.orgmode.search_headings)
		vim.keymap.set("n", "<leader>li", require("telescope").extensions.orgmode.insert_link)
	end,
}
