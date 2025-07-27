-- Horizontal movement
vim.keymap.set({ "n", "x", "o" }, "H", "^") -- go to the first char
vim.keymap.set({ "n", "x", "o" }, "L", "g_") -- go to the last char

-- Navigation
vim.keymap.set({ "n", "x", "o" }, "<leader><leader>", "<C-S-6>") -- alternate file
vim.keymap.set("n", "-", "<CMD>Oil<CR>") -- open oil / go to parent dir

-- Pickers
vim.keymap.set({ "n", "x" }, "<leader>f", MiniPick.builtin.files)
vim.keymap.set({ "n", "x" }, "<leader>sw", MiniPick.builtin.grep_live)
vim.keymap.set({ "n", "x" }, "<leader>ss", function()
	MiniExtra.pickers.lsp({ scope = "document_symbol" })
end)
vim.keymap.set({ "n", "x" }, "<leader>S", function()
	MiniExtra.pickers.lsp({ scope = "workspace_symbol" })
end)

-- LSP
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<cr>", { desc = "Go if err" })

-- Tools
vim.keymap.set({ "n", "x" }, "<leader>gs", MiniGit.show_at_cursor)

-- Windows
vim.keymap.set({ "n", "x" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n", "x" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n", "x" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "n", "x" }, "<C-l>", "<C-w>l")
