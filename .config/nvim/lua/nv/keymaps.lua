local set = vim.keymap.set
set({ "n", "x" }, "<leader>x", vim.cmd.bd)
set({ "n", "x", "o" }, "H", "^")
set({ "n", "x", "o" }, "L", "g_")
set({ "n", "x", "o" }, "<leader><leader>", "<C-S-6>")
set({ "n", "x", "o", "i" }, "<left>", "")
set({ "n", "x", "o", "i" }, "<right>", "")
set({ "n", "x", "o", "i" }, "<up>", "")
set({ "n", "x", "o", "i" }, "<down>", "")
