-- Horizontal movement
vim.keymap.set({ "n", "x", "o" }, "H", "^") -- go to the first char
vim.keymap.set({ "n", "x", "o" }, "L", "g_") -- go to the last char

-- Navigation
vim.keymap.set({ "n", "x", "o" }, "<leader><leader>", "<C-S-6>") -- alternate file
vim.keymap.set("n", "-", "<CMD>Oil<CR>") -- open oil / go to parent dir

-- Windows
vim.keymap.set({ "n", "x" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n", "x" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n", "x" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "n", "x" }, "<C-l>", "<C-w>l")

-- Pickers
vim.keymap.set({ "n", "x" }, "<leader>f", function()
	require("telescope.builtin").find_files({
		hidden = true,
		file_ignore_patterns = {
			"target",
			"node_modules",
			".git",
			"*.png",
			"*.wav",
			"*.mp3",
			"*.o",
			"*.ttf",
			"*.class",
		},
	})
end)
vim.keymap.set({ "n", "x" }, "<leader>sw", "<cmd>Telescope live_grep<cr>")
vim.keymap.set({ "n", "x" }, "<leader>ss", "<cmd>Telescope lsp_document_symbols theme=ivy<cr>")
vim.keymap.set({ "n", "x" }, "<leader>S", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
vim.keymap.set({ "n", "x" }, "<leader>gc", "<cmd>Telescope git_commits<cr>")

-- LSP
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<cr>", { desc = "Go if err" })

-- DAP
vim.keymap.set({ "n", "x" }, "<leader>b", "<cmd>DapToggleBreakpoint<cr>")
vim.keymap.set({ "n", "x" }, "<leader>dr", "<cmd>DapRestart<cr>")
vim.keymap.set({ "n", "x" }, "<leader>ds", "<cmd>DapTerminate<cr>")
vim.keymap.set({ "n", "x" }, "<leader>dc", "<cmd>DapContinue<cr>")
vim.keymap.set({ "n", "x" }, "<Leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set({ "n", "x" }, "<leader>di", "<cmd>DapStepInto<cr>")
vim.keymap.set({ "n", "x" }, "<leader>do", "<cmd>DapStepOver<cr>")
vim.keymap.set({ "n", "x" }, "<leader>dO", "<cmd>DapStepOut<cr>")
vim.keymap.set({ "n", "x" }, "<leader>db", "<cmd>DapStepBack<cr>")
vim.keymap.set({ "n", "x" }, "<leader>du", "<cmd>DapViewToggle<cr>")

-- Tools
vim.keymap.set({ "n", "x" }, "<leader>gs", "<cmd>Neogit kind=vsplit<CR>")
