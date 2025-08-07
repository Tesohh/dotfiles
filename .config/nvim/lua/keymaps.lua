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

-- LSP
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<cr>", { desc = "Go if err" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
