require("snacks").setup({
	indent = { enabled = true, animate = { enabled = false }, scope = { enabled = false } },
	bigfile = { enabled = true },
	image = {
		enabled = false,
		doc = { inline = false, float = false },
		math = { enabled = false },
	},
	input = { enabled = true },
	notifier = { enabled = false, style = "minimal", top_down = false },
	picker = { enabled = true, main = { file = false } },
})

-- stylua: ignore start
vim.keymap.set("n","<leader>f",function() Snacks.picker.files({exclude={"*.png","*.jpg","*.mp3","*.o"}}) end,{desc="Jump to file"})
vim.keymap.set("n","<leader>sw",function() Snacks.picker.grep() end,{desc="Search Words (grep)"})
vim.keymap.set("n","<leader>sf",function() Snacks.picker.files() end,{desc="Search Files"})
vim.keymap.set("n","<leader>ss",function() Snacks.picker.lsp_symbols() end,{desc="Search LSP Symbols"})
vim.keymap.set("n","<leader>S",function() Snacks.picker.lsp_workspace_symbols() end,{desc="LSP Workspace Symbols"})
vim.keymap.set("n","<leader>sd",function() Snacks.picker.diagnostics() end,{desc="Search Diagnostics"})
vim.keymap.set("n","<leader>gs",function() Snacks.picker.git_status() end,{desc="Git status"})
vim.keymap.set("n","<leader>gh",function() Snacks.picker.git_status() end,{desc="Git status"})
vim.keymap.set("n","<leader>j",function() Snacks.picker.lines() end,{desc="Jump to Buffer Lines"})
vim.keymap.set("n","gd",function() Snacks.picker.lsp_definitions() end,{desc="Goto Definition"})
vim.keymap.set("n","gD",function() Snacks.picker.lsp_declarations() end,{desc="Goto Declaration"})
vim.keymap.set("n","grr",function() Snacks.picker.lsp_references() end,{desc="References",nowait=true})
vim.keymap.set("n","gri",function() Snacks.picker.lsp_implementations() end,{desc="Goto Implementation"})
vim.keymap.set("n","grt",function() Snacks.picker.lsp_type_definitions() end,{desc="Goto Type Definition"})
-- stylua: ignore end
