return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-orgmode/telescope-orgmode.nvim",
		"nvim-orgmode/org-bullets.nvim",
		"danilshvalov/org-modern.nvim",
		"saghen/blink.cmp",
	},
	opts = {
		org_agenda_files = "~/Nextcloud/org/**/*",
		org_default_notes_file = "~/Nextcloud/org/refile.org",
		-- org_startup_folded = "inherit",
		org_startup_indented = true,
		org_highlight_latex_and_related = "native",
		notifications = {
			enabled = true,
		},
		ui = {
			menu = {
				handler = function(data)
					require("org-modern.menu"):new():open(data)
				end,
			},
			input = {
				use_vim_ui = true,
			},
		},
	},
	config = function(_, opts)
		require("orgmode").setup(opts)
		require("org-bullets").setup()
		require("telescope").load_extension("orgmode")

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

		vim.keymap.set(
			"n",
			"<leader>r",
			require("telescope").extensions.orgmode.refile_heading,
			{ desc = "Org refile heading" }
		)
		vim.keymap.set(
			"n",
			"<leader>sh",
			require("telescope").extensions.orgmode.search_headings,
			{ desc = "Org search headings" }
		)
		vim.keymap.set(
			"n",
			"<leader>li",
			require("telescope").extensions.orgmode.insert_link,
			{ desc = "Org insert link" }
		)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "org",
			callback = function()
				vim.cmd([[norm zx]])
				vim.keymap.set(
					{ "n", "i" },
					"<S-CR>",
					'<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>',
					{
						desc = "meta return",
						silent = true,
						buffer = true,
					}
				)
			end,
		})
		-- vim.api.nvim_create_autocmd("FileType", {
		-- 	pattern = "org",
		-- 	callback = function()
		-- 		vim.opt_local.shiftwidth = 2
		-- 		vim.opt_local.tabstop = 2
		-- 		vim.opt_local.softtabstop = 2
		-- 		vim.opt_local.expandtab = true
		-- 	end,
		-- })
	end,
}
