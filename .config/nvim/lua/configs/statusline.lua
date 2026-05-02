local function active_content()
	local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
	local git = MiniStatusline.section_git({ trunc_width = 40 })
	local diff = MiniStatusline.section_diff({ trunc_width = 75 })
	local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
	local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
	local grapple = require("grapple").statusline()
	local filename = MiniStatusline.section_filename({ trunc_width = 140 })
	local location = MiniStatusline.section_location({ trunc_width = 75 })
	local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

	return MiniStatusline.combine_groups({
		{ hl = mode_hl, strings = { mode } },
		{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
		"%<", -- Mark general truncate point
		{ hl = "MiniStatuslineFilename", strings = { filename } },
		"%=", -- End left alignment
		{ hl = "MiniStatuslineFileinfo", strings = { grapple } },
		{ hl = mode_hl, strings = { search, location } },
	})
end

require("mini.statusline").setup({
	content = {
		active = active_content,
	},
})
