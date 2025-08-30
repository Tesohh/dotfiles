return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		image = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true, style = "minimal", top_down = false },
		picker = { enabled = true, main = { file = false } },
	},
	keys = {
        -- stylua: ignore start
        { "<leader>f", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>sw", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>sf", function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
        { "<leader>S", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
        { "<leader>j", function() Snacks.picker.lines() end, desc = "Jump to Buffer Lines" },
		-- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
		-- { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
		{ "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
		{ "gri", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
		{ "grt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
		-- stylua: ignore end
	},
}
