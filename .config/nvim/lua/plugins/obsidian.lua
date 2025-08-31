return {
	"obsidian-nvim/obsidian.nvim",
	enabled = false,
	-- version = "*",
	dependencies = {
		"saghen/blink.cmp",
		"folke/snacks.nvim",
	},
	ft = "markdown",
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false,
		workspaces = {
			{
				name = "vault",
				path = "~/Nextcloud/vault",
			},
		},
		completion = {
			nvim_cmp = false,
			blink = true,
		},
		picker = {
			name = "snacks.pick",
		},
		attachments = {
			confirm_img_paste = false,
		},
		checkbox = {
			order = { " ", "x" },
		},
		daily_notes = {
			workdays_only = false,
		},
		footer = {
			enabled = false,
		},
		disable_frontmatter = true,
		note_id_func = function(title)
			return title
		end,
	},
}
