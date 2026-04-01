vim.keymap.set({ "n", "x", "o" }, "H", "^")
vim.keymap.set({ "n", "x", "o" }, "L", "g_")
vim.keymap.set({ "n", "x" }, "<C-w>|", "<cmd>vsplit<cr>", { desc = "split vertical" })
vim.keymap.set({ "n", "x" }, "<C-w>_", "<cmd>split<cr>", { desc = "split horizontal" })
vim.keymap.set({ "n", "x", "o" }, "-", "<cmd>Oil<cr>", { desc = "Oil parent dir" })

vim.keymap.set({ "n", "x" }, "<tab>", "za")
vim.keymap.set({ "n", "x" }, "<c-i>", "<c-i>", { noremap = true })
